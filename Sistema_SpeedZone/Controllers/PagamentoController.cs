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

        public IActionResult Cartao()
        {
            return View();
        }
        [HttpPost]
        public IActionResult Cartao(Cartao cartao)
        {
            if (ModelState.IsValid)
            {
                _pagamentoRepository.InserirCartao(cartao);
                return RedirectToAction("Resumo", "Pedido");
            }
            return View(cartao);
        }

        public IActionResult Pix()
        {
            return View();
        }
    }
}
