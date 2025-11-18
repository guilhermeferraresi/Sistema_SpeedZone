using Sistema_SpeedZone.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Sistema_SpeedZone.Repository.Contract
{
    public interface IClienteRepository
    {
        Usuario Login(string Email, string Senha); 

        void Cadastrar(Usuario usuario);
    }
}
