using Sistema_SpeedZone.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Sistema_SpeedZone.Repository.Contract
{
    public interface IPagamentoRepository
    {
        void InserirCartao(Cartao cartao);
    }
}
