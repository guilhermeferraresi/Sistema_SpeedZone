    using Microsoft.AspNetCore.Mvc;
using Org.BouncyCastle.Asn1.Crmf;
using Sistema_SpeedZone.Repository;

namespace Sistema_SpeedZone.Controllers
{
    public class PersonalizacaoController : Controller
    {
        private readonly ModeloRepository _modeloRepository;
        public PersonalizacaoController(ModeloRepository modeloRepository)
        {
            _modeloRepository = modeloRepository;
        }
        public async Task<IActionResult> Pintura()
        {
            var cartItems = _modeloRepository.Pinturas(HttpContext.Session);
            return View(cartItems);
        }

        public IActionResult Teto()
        {
            return View();
        }

        public IActionResult Pneus()
        {
            return View();
        }

        public IActionResult Kits()
        {
            return View();
        }
    }
}
