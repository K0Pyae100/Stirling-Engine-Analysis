clear all
close all
Extract=xlsread('data.xls');

theta = Extract(:,1);
u = Extract(:,2);
v = Extract(:,3);
p = Extract(:,4);

R = 2;
pi = 3.1415926535;
rho = 1.204;

a = deg2rad(15);
Area = pi.*R^2;
U = (200*1000)/(3600);
L = 0.8;

% Part i
uvector = [u';v'];
nvector = [cos(theta');sin(theta')];
x = sum(uvector.*nvector,1)
f1 = rho.*v.*x';
nexttile
plot(theta,f1,'k-','linewidth',2)
xlabel('$\theta$','Interpreter','latex','FontSize',20)
ylabel('$pv(\textbf{u}\cdot\hat{\textbf{c}})$','Interpreter','latex','FontSize',20)

% part ii
function_2 = p.*sin(theta);

nexttile
plot(theta,function_2,'k-','linewidth',2)
xlabel('$\theta$','Interpreter','latex','FontSize',20)
ylabel('$p\sin\theta$','Interpreter','latex','FontSize',20)


% Part D
Integral1=1.204*2*(v.*u.*cos(theta)+v.^2.*sin(theta))
Fpyfunction=2*p.*sin(theta)
AreaFL=trapz(-theta,Integral1)
AreaFpy=trapz(-theta,Fpyfunction)
Fl=AreaFL+ AreaFpy
Cl=Fl/(1/2*1.23*((200*1000/3600)^2)*0.8)
