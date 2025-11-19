using Sistema_SpeedZone.Libraries.Login;
using Sistema_SpeedZone.Repository;
using Sistema_SpeedZone.Repository.Contract;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddControllersWithViews();

//Adicionando para manipular a sessao
builder.Services.AddHttpContextAccessor();

//Adicionando a interface como um serviço
builder.Services.AddScoped<IClienteRepository, ClienteRepository>();
builder.Services.AddScoped<IFuncionarioRepository, FuncionarioRepository>();
builder.Services.AddScoped<IModeloRepository, ModeloRepository>();

//builder.Services.AddScoped<IModeloRepository, ModeloRepository>();


//Corrigir problema com TEMPDATA
builder.Services.AddDistributedMemoryCache();
builder.Services.AddSession(options =>
{
    //Define um tempo para a duração
    options.IdleTimeout = TimeSpan.FromSeconds(60);
    options.Cookie.HttpOnly = true;
    //Mostra para o navegador que o cookie é essencial
    options.Cookie.IsEssential = true;
});
builder.Services.AddMvc().AddSessionStateTempDataProvider();

builder.Services.AddScoped<Sistema_SpeedZone.Libraries.Sessao.Sessao>();

builder.Services.AddScoped<LoginUsuario>();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
}
app.UseStaticFiles();

app.UseRouting();

app.UseAuthorization();
app.UseCookiePolicy();
app.UseSession();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");

app.Run();
