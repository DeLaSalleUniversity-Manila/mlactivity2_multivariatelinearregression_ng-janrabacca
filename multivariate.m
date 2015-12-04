  x=load('xdata.dat');
  y=load('ydata.dat');
  plot(x,y,'go');
  m=47;
  x=[ones(m,1), x];
  sigma= std(x);
  mu = mean(x);
  x(:,2) = (x(:,2) - mu(2))./ sigma(2);
  x(:,3) = (x(:,3) - mu(3))./ sigma(3);
  theta=zeros(size(x(1,:)))';
  a=0.3;
  J=zeros(50,1);
  for num_iterations = 1:50
    % theta =  theta - (a * (1/m) * x' * (x * theta-y));     
      theta =  (inv(x' * x)) * (x'*y);  
      J(num_iterations) = ( (1/(2*m)) * (x * theta-y)' *(x * theta-y));
   end
    c = theta(3) + 4*theta(2) + 3*theta(1);
  plot(0:49, J(1:50),'g-');
   hold on;

 