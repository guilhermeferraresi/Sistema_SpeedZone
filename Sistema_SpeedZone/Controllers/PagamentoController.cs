using Microsoft.AspNetCore.Mvc;

namespace Sistema_SpeedZone.Controllers
{
    public class PagamentoController : Controller
    {
        public IActionResult Cartao()
        {
            return View();
        }

        public IActionResult Pix()
        {
            return View();
        }
    }
}
