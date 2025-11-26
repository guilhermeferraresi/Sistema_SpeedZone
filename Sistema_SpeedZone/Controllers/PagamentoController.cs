using Microsoft.AspNetCore.Mvc;
using Sistema_SpeedZone.Libraries.Login;
using Sistema_SpeedZone.Models;
using Sistema_SpeedZone.Repository;
using Sistema_SpeedZone.Repository.Contract;

namespace Sistema_SpeedZone.Controllers
{
    public class PagamentoController : Controller
    {
        private IPagamentoRepository _pagamentoRepository;

        public PagamentoController(IPagamentoRepository pagamentoRepository)
        {
            _pagamentoRepository = pagamentoRepository;
        }

        public IActionResult CadastrarCartao()
        {
            return View();
        }
        [HttpPost]
        public IActionResult CadastrarCartao(Cartao cartao)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    _pagamentoRepository.CadastrarCartao(cartao);
                    return RedirectToAction("Login");
                }
                catch (Exception ex)
                {
                    ViewData["MSG_E"] = ex.Message; // "As senhas não coincidem."
                }
            }
            return View(cartao);
        }

        public IActionResult Pix()
        {
            return View();
        }
    }
}
