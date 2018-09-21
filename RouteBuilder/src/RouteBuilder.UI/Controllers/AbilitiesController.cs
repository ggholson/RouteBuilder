namespace RouteBuilder.UI.Controllers
{
    using System;
    using System.Collections;
    using System.Collections.Generic;
    using Microsoft.AspNetCore.Http;
    using Microsoft.AspNetCore.Mvc;
    using RouteBuilder.Application.Contracts;
    using RouteBuilder.Core.Enums;
    using RouteBuilder.Core.Models.Entity;

    public class AbilitiesController : Controller
    { 
        private readonly IAbilityService abilityService;

        public AbilitiesController(IAbilityService abilityService)
        {
            this.abilityService = abilityService;
        }

        public ActionResult Get(int abilityId)
        {
            var ability = this.abilityService.GetAbility((short) abilityId);
            return new JsonResult(ability);
        }

        public ActionResult Character(int id)
        {
            var character = (Characters) id;

            IList<CharacterAbility> abilities = this.abilityService.GetCharacterAbilities(character);

            return new JsonResult(abilities);
        }

//        // GET: Ability/Details/5
//        public ActionResult Details(int id)
//        {
//            return View();
//        }
//
//        // GET: Ability/Create
//        public ActionResult Create()
//        {
//            return View();
//        }
//
//        // POST: Ability/Create
//        [HttpPost]
//        [ValidateAntiForgeryToken]
//        public ActionResult Create(IFormCollection collection)
//        {
//            try
//            {
//                // TODO: Add insert logic here
//
//                return RedirectToAction(nameof(Index));
//            }
//            catch
//            {
//                return View();
//            }
//        }
//
//        // GET: Ability/Edit/5
//        public ActionResult Edit(int id)
//        {
//            return View();
//        }
//
//        // POST: Ability/Edit/5
//        [HttpPost]
//        [ValidateAntiForgeryToken]
//        public ActionResult Edit(int id, IFormCollection collection)
//        {
//            try
//            {
//                // TODO: Add update logic here
//
//                return RedirectToAction(nameof(Index));
//            }
//            catch
//            {
//                return View();
//            }
//        }
//
//        // GET: Ability/Delete/5
//        public ActionResult Delete(int id)
//        {
//            return View();
//        }
//
//        // POST: Ability/Delete/5
//        [HttpPost]
//        [ValidateAntiForgeryToken]
//        public ActionResult Delete(int id, IFormCollection collection)
//        {
//            try
//            {
//                // TODO: Add delete logic here
//
//                return RedirectToAction(nameof(Index));
//            }
//            catch
//            {
//                return View();
//            }
//        }
    }
}