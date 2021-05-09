clear all;
clc;
k1 = 2;
k1a = 10;
k1b = 5;
k2 = 15;
k3 = 1.6;
k4 = 15;
k5 = 1.7;
k6 = 2;
k6p = 0.5;
k6q = 0.5;
k7 = 1.0;
k7s = 0.5;
k7r = 0.5;
k8 = 0.01;
k9 = 0.01;
k10 = 0.025;
k11 = 4.0;
k11a = 1.5;
k12 = 1;
k12r = 0.55;
k13 = 12;
k13r = 4.5;
k13a = 1.8;
k14 = 5;
k14a = 0.1;
k15 = 6.5;
k15a = 10;
k16 = 0.05;
k17= 0.06;
k18 = 0.09;
k19 = 0.09;
k20 = 0.1;
M = 1;
N = 20000;
k = 50;
P = zeros(N+1,10,k);
%P(1,7,:) = 50;
for ijk = 1:6;
    ijk
   if ijk == 1
    S = 0;
   elseif (ijk ==2)
       S = 10;
   elseif (ijk == 3)
       S = 0;
   elseif (ijk == 4)
       S = 1.5;
   elseif(ijk == 5)
       S = 10;
   else
       S = 1.5;
   end
   %P_flag = xlsread('stochasic',1);
    for j = 1:k; 
        j
%         if (ijk ~=1)
%             for ij = 1:10;
%                 P(1,ij,j) = floor(P_flag(ij));
%             end
%         end
        for n=M:N %choosing next generation
            R(1) = (k1*P(n,1,j)*(S/k1a))/((1 + (S/k1a))*(k1b + P(n,1,j))); %Autotphosphorylation form BvgS to BvgS-P1
            R(2) = k2*P(n,2,j); %p1 to p2
            R(3) = k3*P(n,3,j); %p2 to null
            R(4) = k4*P(n,3,j);
            R(5) = k5*P(n,4,j);
            R(6) = (k6*P(n,4,j)*P(n,5,j))/((k6p + P(n,4,j)) * (k6q + P(n,5,j)));
            R(7) = (k7*P(n,1,j)*P(n,6,j))/((k7r + P(n,1,j)) * (k7s + P(n,6,j)));
            R(8) = k8*P(n,1,j);
            R(9) = k9*P(n,5,j);
            R(10) = k10*P(n,6,j);
            R(11) = (k11*((P(n,6,j)^2)))/((k11a^2) + (P(n,6,j)^2));
            R(12) = k12/(1 + ((P(n,6,j)/k12r)^2));
            R(13) = (k13*(P(n,6,j)^2))/(((k13a^2) + (P(n,6,j)^2))*(1 + ((P(n,6,j)/k13r)^2)));
            R(14) = (k14*(P(n,6,j)^2))/((k14a^2) + (P(n,6,j)^2));
            R(15) = (k15*(P(n,6,j)^4))/((k15a^4) + (P(n,6,j)^4));
            R(16) = k16*P(n,7,j);
            R(17) = k17*P(n,8,j);
            R(18) = k18*P(n,9,j);
            R(19) = k19*P(n,10,j);
            R(20) = k20;
            
            A = sum(R);
            flag = A*rand;
            
            if(flag < R(1))
                P(n+1,1,j) = P(n,1,j) - 1;
                P(n+1,2,j) = P(n,2,j) + 1;
                P(n+1,3,j) = P(n,3,j);
                P(n+1,4,j) = P(n,4,j);
                P(n+1,5,j) = P(n,5,j);
                P(n+1,6,j) = P(n,6,j);
                P(n+1,7,j) = P(n,7,j);
                P(n+1,8,j) = P(n,8,j);
                P(n+1,9,j) = P(n,9,j);
                P(n+1,10,j) = P(n,10,j);
                
            elseif((flag >= R(1)) && (flag < R(1)+ R(2)))
                P(n+1,1,j) = P(n,1,j);
                P(n+1,2,j) = P(n,2,j) - 1;
                P(n+1,3,j) = P(n,3,j) + 1;
                P(n+1,4,j) = P(n,4,j);
                P(n+1,5,j) = P(n,5,j);
                P(n+1,6,j) = P(n,6,j);
                P(n+1,7,j) = P(n,7,j);
                P(n+1,8,j) = P(n,8,j);
                P(n+1,9,j) = P(n,9,j);
                P(n+1,10,j) = P(n,10,j);
                
            elseif((flag >= R(1) + R(2)) && (flag < R(1)+ R(2) + R(3)))
                P(n+1,1,j) = P(n,1,j) + 1;
                P(n+1,2,j) = P(n,2,j);
                P(n+1,3,j) = P(n,3,j) - 1;
                P(n+1,4,j) = P(n,4,j);
                P(n+1,5,j) = P(n,5,j);
                P(n+1,6,j) = P(n,6,j);
                P(n+1,7,j) = P(n,7,j);
                P(n+1,8,j) = P(n,8,j);
                P(n+1,9,j) = P(n,9,j);
                P(n+1,10,j) = P(n,10,j);
            elseif((flag >= R(1) + R(2) + R(3)) && (flag < R(1)+ R(2) + R(3) + R(4)))
                P(n+1,1,j) = P(n,1,j);
                P(n+1,2,j) = P(n,2,j);
                P(n+1,3,j) = P(n,3,j) - 1;
                P(n+1,4,j) = P(n,4,j) + 1;
                P(n+1,5,j) = P(n,5,j);
                P(n+1,6,j) = P(n,6,j);
                P(n+1,7,j) = P(n,7,j);
                P(n+1,8,j) = P(n,8,j);
                P(n+1,9,j) = P(n,9,j);
                P(n+1,10,j) = P(n,10,j);
            elseif((flag >= R(1) + R(2) + R(3) + R(4)) && (flag < R(1)+ R(2) + R(3) + R(4) + R(5)))
                P(n+1,1,j) = P(n,1,j);
                P(n+1,2,j) = P(n,2,j);
                P(n+1,3,j) = P(n,3,j) + 1;
                P(n+1,4,j) = P(n,4,j) - 1;
                P(n+1,5,j) = P(n,5,j);
                P(n+1,6,j) = P(n,6,j);
                P(n+1,7,j) = P(n,7,j);
                P(n+1,8,j) = P(n,8,j);
                P(n+1,9,j) = P(n,9,j);
                P(n+1,10,j) = P(n,10,j);
            elseif((flag >= R(1) + R(2) + R(3) + R(4) + R(5)) && (flag < R(1)+ R(2) + R(3) + R(4) + R(5) + R(6)))
                P(n+1,1,j) = P(n,1,j) + 1;
                P(n+1,2,j) = P(n,2,j);
                P(n+1,3,j) = P(n,3,j);
                P(n+1,4,j) = P(n,4,j) - 1;
                P(n+1,5,j) = P(n,5,j) - 1;
                P(n+1,6,j) = P(n,6,j) + 1;
                P(n+1,7,j) = P(n,7,j);
                P(n+1,8,j) = P(n,8,j);
                P(n+1,9,j) = P(n,9,j);
                P(n+1,10,j) = P(n,10,j);
            elseif((flag >= R(1) + R(2) + R(3) + R(4) + R(5) + R(6)) && (flag < R(1)+ R(2) + R(3) + R(4) + R(5) + R(6) + R(7)))
                P(n+1,1,j) = P(n,1,j) - 1;
                P(n+1,2,j) = P(n,2,j);
                P(n+1,3,j) = P(n,3,j);
                P(n+1,4,j) = P(n,4,j) + 1;
                P(n+1,5,j) = P(n,5,j) + 1;
                P(n+1,6,j) = P(n,6,j) - 1;
                P(n+1,7,j) = P(n,7,j);
                P(n+1,8,j) = P(n,8,j);
                P(n+1,9,j) = P(n,9,j);
                P(n+1,10,j) = P(n,10,j);
            elseif((flag >= R(1) + R(2) + R(3) + R(5) + R(4) + R(6) + R(7)) && (flag < R(1)+ R(2) + R(3) + R(4) + R(5) + R(6) + R(7) + R(8)))
                P(n+1,1,j) = P(n,1,j) - 1;
                P(n+1,2,j) = P(n,2,j);
                P(n+1,3,j) = P(n,3,j);
                P(n+1,4,j) = P(n,4,j);
                P(n+1,5,j) = P(n,5,j) ;
                P(n+1,6,j) = P(n,6,j);
                P(n+1,7,j) = P(n,7,j);
                P(n+1,8,j) = P(n,8,j);
                P(n+1,9,j) = P(n,9,j);
                P(n+1,10,j) = P(n,10,j);
            elseif((flag >= R(1) + R(2) + R(3) + R(5) + R(4) + R(6) + R(7) + R(8)) && flag < (R(1)+ R(2) + R(3) + R(4) + R(5) + R(6) + R(7) + R(8) + R(9)))
                P(n+1,1,j) = P(n,1,j);
                P(n+1,2,j) = P(n,2,j);
                P(n+1,3,j) = P(n,3,j);
                P(n+1,4,j) = P(n,4,j);
                P(n+1,5,j) = P(n,5,j) - 1;
                P(n+1,6,j) = P(n,6,j);
                P(n+1,7,j) = P(n,7,j);
                P(n+1,8,j) = P(n,8,j);
                P(n+1,9,j) = P(n,9,j);
                P(n+1,10,j) = P(n,10,j);
            elseif((flag >= R(1) + R(2) + R(3) + R(5) + R(4) + R(6) + R(7) + R(8) + R(9)) && (flag < R(1)+ R(2) + R(3) + R(4) + R(5) + R(6) + R(7) + R(8) + R(9) + R(10)))
                P(n+1,1,j) = P(n,1,j);
                P(n+1,2,j) = P(n,2,j);
                P(n+1,3,j) = P(n,3,j);
                P(n+1,4,j) = P(n,4,j);
                P(n+1,5,j) = P(n,5,j);
                P(n+1,6,j) = P(n,6,j) - 1;
                P(n+1,7,j) = P(n,7,j);
                P(n+1,8,j) = P(n,8,j);
                P(n+1,9,j) = P(n,9,j);
                P(n+1,10,j) = P(n,10,j);
            elseif((flag >= R(1)+R(2)+R(3)+R(5)+R(4)+R(6)+R(7)+R(8)+R(9)+R(10)) && (flag < R(1)+R(2)+R(3)+R(4)+R(5)+R(6)+R(7)+R(8)+R(9)+R(10)+R(11)))
                P(n+1,1,j) = P(n,1,j) + 1;
                P(n+1,2,j) = P(n,2,j);
                P(n+1,3,j) = P(n,3,j);
                P(n+1,4,j) = P(n,4,j);
                P(n+1,5,j) = P(n,5,j) + 1;
                P(n+1,6,j) = P(n,6,j);
                P(n+1,7,j) = P(n,7,j);
                P(n+1,8,j) = P(n,8,j);
                P(n+1,9,j) = P(n,9,j);
                P(n+1,10,j) = P(n,10,j);
            elseif((flag >= R(1)+R(2)+R(3)+R(5)+R(4)+R(6)+R(7)+R(8)+R(9)+R(10)+R(11)) && (flag <R(1)+R(2)+R(3)+R(4)+R(5)+R(6)+R(7)+R(8)+R(9)+R(10)+R(11)+R(12)))
                P(n+1,1,j) = P(n,1,j);
                P(n+1,2,j) = P(n,2,j);
                P(n+1,3,j) = P(n,3,j);
                P(n+1,4,j) = P(n,4,j);
                P(n+1,5,j) = P(n,5,j);
                P(n+1,6,j) = P(n,6,j);
                P(n+1,7,j) = P(n,7,j) + 1;
                P(n+1,8,j) = P(n,8,j);
                P(n+1,9,j) = P(n,9,j);
                P(n+1,10,j) = P(n,10,j);
            elseif((flag >= R(1)+R(2)+R(3)+R(5)+R(4)+R(6)+R(7)+R(8)+R(9)+R(10)+R(11)+R(12)) && (flag<R(1)+R(2)+R(3)+R(4)+R(5)+R(6)+R(7)+R(8)+R(9)+R(10)+R(11)+R(12)+R(13)))
                P(n+1,1,j) = P(n,1,j);
                P(n+1,2,j) = P(n,2,j);
                P(n+1,3,j) = P(n,3,j);
                P(n+1,4,j) = P(n,4,j);
                P(n+1,5,j) = P(n,5,j);
                P(n+1,6,j) = P(n,6,j);
                P(n+1,7,j) = P(n,7,j);
                P(n+1,8,j) = P(n,8,j) + 1;
                P(n+1,9,j) = P(n,9,j);
                P(n+1,10,j) = P(n,10,j);
            elseif((flag >= R(1)+R(2)+R(3)+R(5)+R(4)+R(6)+R(7)+R(8)+R(9)+R(10)+R(11)+R(12)+R(13)) && (flag<R(1)+R(2)+R(3)+R(4)+R(5)+R(6)+R(7)+R(8)+R(9)+R(10)+R(11)+R(12)+R(13)+R(14)))
                P(n+1,1,j) = P(n,1,j);
                P(n+1,2,j) = P(n,2,j);
                P(n+1,3,j) = P(n,3,j);
                P(n+1,4,j) = P(n,4,j);
                P(n+1,5,j) = P(n,5,j);
                P(n+1,6,j) = P(n,6,j);
                P(n+1,7,j) = P(n,7,j);
                P(n+1,8,j) = P(n,8,j);
                P(n+1,9,j) = P(n,9,j) + 1;
                P(n+1,10,j) = P(n,10,j);
            elseif((flag >= R(1)+R(2)+R(3)+R(5)+R(4)+R(6)+R(7)+R(8)+R(9)+R(10)+R(11)+R(12)+R(13)+R(14)) && (flag<R(1)+R(2)+R(3)+R(4)+R(5)+R(6)+R(7)+R(8)+R(9)+R(10)+R(11)+R(12)+R(13)+R(14)+R(15)))
                P(n+1,1,j) = P(n,1,j);
                P(n+1,2,j) = P(n,2,j);
                P(n+1,3,j) = P(n,3,j);
                P(n+1,4,j) = P(n,4,j);
                P(n+1,5,j) = P(n,5,j);
                P(n+1,6,j) = P(n,6,j);
                P(n+1,7,j) = P(n,7,j);
                P(n+1,8,j) = P(n,8,j);
                P(n+1,9,j) = P(n,9,j);
                P(n+1,10,j) = P(n,10,j) + 1;
            elseif((flag >= R(1)+R(2)+R(3)+R(5)+R(4)+R(6)+R(7)+R(8)+R(9)+R(10)+R(11)+R(12)+R(13)+R(14)+R(15)) && (flag<R(1)+R(2)+R(3)+R(4)+R(5)+R(6)+R(7)+R(8)+R(9)+R(10)+R(11)+R(12)+R(13)+R(14)+R(15)+R(16)))
                P(n+1,1,j) = P(n,1,j);
                P(n+1,2,j) = P(n,2,j);
                P(n+1,3,j) = P(n,3,j);
                P(n+1,4,j) = P(n,4,j);
                P(n+1,5,j) = P(n,5,j);
                P(n+1,6,j) = P(n,6,j);
                P(n+1,7,j) = P(n,7,j)-1;
                P(n+1,8,j) = P(n,8,j);
                P(n+1,9,j) = P(n,9,j);
                P(n+1,10,j) = P(n,10,j);
            elseif((flag >= R(1)+R(2)+R(3)+R(5)+R(4)+R(6)+R(7)+R(8)+R(9)+R(10)+R(11)+R(12)+R(13)+R(14)+R(15)+R(16)) && (flag<R(1)+R(2)+R(3)+R(4)+R(5)+R(6)+R(7)+R(8)+R(9)+R(10)+R(11)+R(12)+R(13)+R(14)+R(15)+R(16)+R(17)))
                P(n+1,1,j) = P(n,1,j);
                P(n+1,2,j) = P(n,2,j);
                P(n+1,3,j) = P(n,3,j);
                P(n+1,4,j) = P(n,4,j);
                P(n+1,5,j) = P(n,5,j);
                P(n+1,6,j) = P(n,6,j);
                P(n+1,7,j) = P(n,7,j);
                P(n+1,8,j) = P(n,8,j)-1;
                P(n+1,9,j) = P(n,9,j);
                P(n+1,10,j) = P(n,10,j);
            elseif((flag >= R(1)+R(2)+R(3)+R(5)+R(4)+R(6)+R(7)+R(8)+R(9)+R(10)+R(11)+R(12)+R(13)+R(14)+R(15)+R(16)+R(17)) && (flag<R(1)+R(2)+R(3)+R(4)+R(5)+R(6)+R(7)+R(8)+R(9)+R(10)+R(11)+R(12)+R(13)+R(14)+R(15)+R(16)+R(17)+R(18)))
                P(n+1,1,j) = P(n,1,j);
                P(n+1,2,j) = P(n,2,j);
                P(n+1,3,j) = P(n,3,j);
                P(n+1,4,j) = P(n,4,j);
                P(n+1,5,j) = P(n,5,j);
                P(n+1,6,j) = P(n,6,j);
                P(n+1,7,j) = P(n,7,j);
                P(n+1,8,j) = P(n,8,j);
                P(n+1,9,j) = P(n,9,j)-1;
                P(n+1,10,j) = P(n,10,j);
            elseif((flag >= R(1)+R(2)+R(3)+R(5)+R(4)+R(6)+R(7)+R(8)+R(9)+R(10)+R(11)+R(12)+R(13)+R(14)+R(15)+R(16)+R(17)+R(18)) && (flag<R(1)+R(2)+R(3)+R(4)+R(5)+R(6)+R(7)+R(8)+R(9)+R(10)+R(11)+R(12)+R(13)+R(14)+R(15)+R(16)+R(17)+R(18)+R(19)))
                P(n+1,1,j) = P(n,1,j);
                P(n+1,2,j) = P(n,2,j);
                P(n+1,3,j) = P(n,3,j);
                P(n+1,4,j) = P(n,4,j);
                P(n+1,5,j) = P(n,5,j);
                P(n+1,6,j) = P(n,6,j);
                P(n+1,7,j) = P(n,7,j);
                P(n+1,8,j) = P(n,8,j);
                P(n+1,9,j) = P(n,9,j);
                P(n+1,10,j) = P(n,10,j)-1;
            else(flag >= R(1)+R(2)+R(3)+R(5)+R(4)+R(6)+R(7)+R(8)+R(9)+R(10)+R(11)+R(12)+R(13)+R(14)+R(15)+R(16)+R(17)+R(18)+R(19));
                P(n+1,1,j) = P(n,1,j) + 1;
                P(n+1,2,j) = P(n,2,j);
                P(n+1,3,j) = P(n,3,j);
                P(n+1,4,j) = P(n,4,j);
                P(n+1,5,j) = P(n,5,j) + 1;
                P(n+1,6,j) = P(n,6,j);
                P(n+1,7,j) = P(n,7,j);
                P(n+1,8,j) = P(n,8,j);
                P(n+1,9,j) = P(n,9,j);
                P(n+1,10,j) = P(n,10,j);
            end
            
        end
    end
    P_avg = mean(P,3);
    for index_2 = 1:k;
        for index_1 = 1:10;
       P(N,index_1,index_2) = floor(P_avg(N+1,index_1)); 
        end
    end
    M = N;
    N = N + 20000;
end
    h(ijk) = figure();
    axes('FontSize',26,'LineWidth',4.5);
    plot(P_avg(:,7),'color','r','LineWidth',2.5);
    hold on;
    plot(P_avg(:,8),'color','g','LineWidth',2.5);
    plot(P_avg(:,9),'color','b','LineWidth',2.5);
    plot(P_avg(:,10),'color','y','LineWidth',2.5);
    ylabel('Protein level(A.U.)','FontSize',26);
    xlabel('time (A.U.)','FontSize',26);
    leg = legend('class1','class2','class3','class4','Location','northwest','Fontsize',16);
    legend boxoff;
    %title('kd','FontSize',30);
    print(h(ijk),'-djpeg','-r600',[num2str(ijk)]);
%     if (ijk == 1)
%         xlswrite('stochasic',P_avg(N+1,:),1);
%         S = 0;
%         N = 9999;
%     elseif(ijk == 2)
%         xlswrite('stochasic',P_avg(N+1,:),1);
%         S = 1.5;
%     end
% 
% for  i = 1:100;
%     A(i) = P(5000,10,i);
% end
