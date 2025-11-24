    using Microsoft.AspNetCore.Mvc;
using Org.BouncyCastle.Asn1.Crmf;
using Sistema_SpeedZone.Repository;

namespace Sistema_SpeedZone.Controllers
{
    public class PersonalizacaoController : Controller
    {
        /*private readonly ModeloRepository _modeloRepository;
        public PersonalizacaoController(ModeloRepository modeloRepository)
        {
            _modeloRepository = modeloRepository;
        }*/
        public IActionResult Personalizacao()
        {
            return View();
        }

        public IActionResult Brands()
        {
            return View();
        }

        public IActionResult Brands2()
        {
            return View();
        }

        public IActionResult Brands3()
        {
            return View();
        }
    }
}
