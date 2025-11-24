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
                return new RedirectResult(Url.Action(nameof(PainelUsuario)));
            }
            else
            {
                //Erro na sessão
                ViewData["MSG_E"] = "Usuário não localizado, por favor verifique se o e-mail e a senha esão digitados corretamente.";
                return View();
            }
        }

        public IActionResult PainelUsuario()
        {
            ViewBag.Nome = _loginUsuario.GetUsuario().Nome;
            ViewBag.CPF = _loginUsuario.GetUsuario().CPF;
            return View();
        }

        public IActionResult Cadastrar()
        {
            return View();
        }
        [HttpPost]
        public IActionResult Cadastrar(Usuario usuario)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    _clienteRepository.Cadastrar(usuario);
                    return RedirectToAction("Login");
                }
                catch (Exception ex)
                {
                    ViewData["MSG_E"] = ex.Message; // "As senhas não coincidem."
                }
            }
            return View(usuario);
        }

        
    }
}
