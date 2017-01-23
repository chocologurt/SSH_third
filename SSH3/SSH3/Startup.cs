using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(SSH3.Startup))]
namespace SSH3
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
