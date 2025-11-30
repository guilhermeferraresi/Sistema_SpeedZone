using Sistema_SpeedZone.Models;

namespace Sistema_SpeedZone.Repository.Contract
{
    public interface IPedidoRepository
    {
        IEnumerable<Pedido> ObterTodosPedidos();
    }
}
