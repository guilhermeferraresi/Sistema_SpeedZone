using Microsoft.AspNetCore.Mvc;
using Sistema_SpeedZone.Libraries.Login;
using Sistema_SpeedZone.Models;
using Sistema_SpeedZone.Repository.Contract;

namespace Sistema_SpeedZone.Controllers
{
    public class UsuarioController : Controller
    {
        private IClienteRepository _clienteRepository;
        private LoginUsuario _loginUsuario;

        public UsuarioController(IClienteRepository clienteRepository, LoginUsuario loginUsuario)
        {
            _clienteRepository = clienteRepository;
            _loginUsuario = loginUsuario;
        }
        public IActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Login([FromForm] Usuario usuario)
        {
            Usuario usuarioDB = _clienteRepository.Login(usuario.Email, usuario.Senha);

            if (usuarioDB.Email != null && usuarioDB.Senha != null)
            {
                _loginUsuario.Login(usuarioDB);
                return new RedirectResult(Url.Action(nameof(Index)));
            }
            else
            {
                //Erro na sessão
                ViewData["MSG_E"] = "Usuário não localizado, por favor verifique se o e-mail e a senha esão digitados corretamente.";
                return View();
            }
        }

        public IActionResult Cadastro()
        {
            return View();
        }
        [HttpPost]
        public IActionResult Cadastro(Usuario usuario)
        {
            if (ModelState.IsValid)
            {
                _clienteRepository.Cadastrar(usuario);

                return RedirectToAction("Login");
            }
            return View(usuario);
        }
    }
}
