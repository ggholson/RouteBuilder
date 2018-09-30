export function GetNumericValues(type : any) : Number[] {
    const values : Number[] = [];

    for (const item in type) {
        if (!isNaN(Number(item))) {
            values.push(Number(item));
        }
    }

    return values;
}

export function GetStringValues(type : any) : string[] {
    const values : string[] = [];

    for (const item in type) {
        if (isNaN(Number(item))) {
            values.push(item);
        }
    }

    return values;
}