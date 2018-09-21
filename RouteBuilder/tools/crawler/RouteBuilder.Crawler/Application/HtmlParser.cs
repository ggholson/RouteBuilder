namespace RouteBuilder.Crawler.Application
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Reflection;
    using Fizzler.Systems.HtmlAgilityPack;
    using HtmlAgilityPack;
    using RouteBuilder.Core.Attributes;

    internal class HtmlParser
    {
        private static readonly string[] ValidCells = new[] { "th", "td" };

        internal IList<T> ParseTable<T>(HtmlNode table)
            where T : new()
        {
            IList<T> data = new List<T>();
            IList<HtmlNode> rows = table.QuerySelectorAll("tr").ToList();

            HtmlNode headerRow = rows.First();

            var tempHeaders = new List<string>();
            foreach (var cell in headerRow.QuerySelectorAll("th"))
            {
                tempHeaders.Add(cell.InnerText.Trim());
            }

            string[] headers = tempHeaders.ToArray();

            var dataRows = rows.Skip(1);

            foreach (var row in dataRows)
            {
                T rowData = this.ParseRow<T>(row, headers);
                
                if (rowData != null)
                {
                    data.Add(rowData);
                }
            }

            return data;
        }

        private T ParseRow<T>(HtmlNode row, string[] headers)
            where T : new()
        {
            var obj = new T();
            var objType = obj.GetType();
            var mappings = this.MapProperties(objType);

            HtmlNode[] cells = row.ChildNodes.Where(n => ValidCells.Contains(n.Name)).ToArray();

            if (cells.Length < headers.Length)
            {
                return default(T);
            }

            for (int i = 0; i < cells.Length; i++)
            {
                string header = headers[i];
                string cell = cells[i].InnerText.Trim();

                if (mappings.ContainsKey(header))
                {
                    PropertyInfo property = mappings[header];
                    if (property != null)
                    {
                        object value = this.ParseValue(cell, property.PropertyType);
                        property.SetValue(obj, value);
                    }
                }
            }

            return obj;
        }

        private Dictionary<string, PropertyInfo> MapProperties(Type type)
        {
            var mappings = new Dictionary<string, PropertyInfo>();

            PropertyInfo[] properties = type.GetProperties();

            foreach (PropertyInfo property in properties)
            {
                string header;

                if (property.GetCustomAttributes(typeof(HeaderAttribute), false).FirstOrDefault() is HeaderAttribute attr)
                {
                    header = attr.Header;
                }
                else
                {
                    header = property.Name;
                }

                mappings.Add(header, property);
            }

            return mappings;
        }

        private object ParseValue(string cell, Type property)
        {
            if (property == typeof(string))
            {
                return cell;
            }

            ConstructorInfo constructor = property.GetConstructor(new[] {typeof(string)});
            if (constructor != null)
            {
                return constructor.Invoke(new object[] {cell});
            }

            return Convert.ChangeType(cell, property);
        }
    }
}
