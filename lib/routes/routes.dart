const rootRoute = "/";

//Authentication
const loginPageDisplayName = "Login";
const loginPageRoute = "/login";

const logoutPageDisplayName = "Log out";
const logoutPageRoute = "/logout";

const homePageDisplayName = "Home";
const homePageRoute = "/home";

//Example Page
const gridviewPageDisplayName = "Grid View";
const gridviewPageRoute = "/gridview";

const loadlocalimagePageDisplayName = "Load Local Image";
const loadlocalimagePageRoute = "/loadlocalimage";

const loadlocaljsonPageDisplayName = "Load Local JSON";
const loadlocaljsonPageRoute = "/loadlocaljson";

const loadmoreusingapiPageDisplayName = "Load More Using API";
const loadmoreusingapiPageRoute = "/loadmoreusingapi";

const settingsPageDisplayName = "Settings";
const settingsPageRoute = "/settings";

class MenuItem {
  final String name;
  final String route;
  MenuItem(this.name, this.route);
}

// SplashView
List<MenuItem> sideMenuItemRoutes = [
  MenuItem(homePageDisplayName, homePageRoute),
  MenuItem(gridviewPageDisplayName, gridviewPageRoute),
  MenuItem(loadlocalimagePageDisplayName, loadlocalimagePageRoute),
  MenuItem(loadlocaljsonPageDisplayName, loadlocaljsonPageRoute),
  MenuItem(loadmoreusingapiPageDisplayName, loadmoreusingapiPageRoute),
  MenuItem(settingsPageDisplayName, settingsPageRoute),
];
