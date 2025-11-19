using Microsoft.AspNetCore.Mvc;

namespace Sistema_SpeedZone.Controllers
{
    public class PedidoController : Controller
    {
        public IActionResult Resumo()
        {
            return View();
        }

        public IActionResult Compra()
        {
            ViewBag.Nome = "Guilherme";
            return View();
        }

    }
}
