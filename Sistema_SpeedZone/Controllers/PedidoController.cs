using Microsoft.AspNetCore.Mvc;
using Sistema_SpeedZone.Libraries.Login;
using Sistema_SpeedZone.Repository.Contract;

namespace Sistema_SpeedZone.Controllers
{
    public class PedidoController : Controller
    {
        private IClienteRepository _clienteRepository;
        private LoginUsuario _loginUsuario;

        public PedidoController(IClienteRepository clienteRepository, LoginUsuario loginUsuario)
        {
            _clienteRepository = clienteRepository;
            _loginUsuario = loginUsuario;
        }
        public IActionResult Resumo()
        {
            return View();
        }

        public IActionResult Compra()
        {
            ViewBag.Nome = _loginUsuario.GetUsuario().Nome;
            return View();
        }

    }
}
