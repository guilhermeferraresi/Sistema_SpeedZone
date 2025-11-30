using Microsoft.AspNetCore.Mvc;
using Sistema_SpeedZone.Libraries.Login;
using Sistema_SpeedZone.Models;
using Sistema_SpeedZone.Repository.Contract;

namespace Sistema_SpeedZone.Controllers
{
    public class PedidoController : Controller
    {
        private IPedidoRepository _pedidoRepository;
        private LoginUsuario _loginUsuario;
        private IClienteRepository _clienteRepository;

        public PedidoController(LoginUsuario loginUsuario, IPedidoRepository pedidoRepository, IClienteRepository clienteRepository)
        {
            _loginUsuario = loginUsuario;
            _pedidoRepository = pedidoRepository;
            _clienteRepository = clienteRepository;
        }
        public IActionResult Resumo()
        {
            return View(_pedidoRepository.ObterTodosPedidos());
        }

        public IActionResult Compra(Usuario usuario)
        {
            Usuario usuarioDB = _clienteRepository.Login(usuario.Email, usuario.Senha);

            if (usuarioDB.Email != null && usuarioDB.Senha != null)
            {
                ViewBag.Nome = _loginUsuario.GetUsuario().Nome;
                return View();
            }
            else
            {
                return RedirectToAction("Login", "Usuario");
            }
            
        }

    }
}
