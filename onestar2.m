function [a] = onestar(b)
%     for i=1:10
%         I=double(imread('D:\\Matlab\\bin\\手写签名-粗'+str2num(i)+'.jpg'))./255;
%         I(I>0.5)=1;
%         I(I<0.5)=0;
%         I=abs(1-I);
%         I=imresize(I,1/6);
%         II=ones(600);
%         II(301-34:300+34,300-29:300+29)=abs(1-I);
%         II(II>0.5)=1;II(II<0.5)=0;
%         imshow(II)
%         [x2,y2]=find(II~=1);
%     end
    
    filename='D:\\Matlab\\bin\\star.gif';
    star =zeros(600,600,3);
    frame = 1; % current frame 
    r1 = 150; % light source in a circle ,radious is r1
    ii=0;
    a=rand(1);
        b=rand(1);
        c=rand(1);
    while(ii<10)
        ii=ii+1;
        
%         imshow(II)
        
    for k=1:60 %loop differrent images
       
        x2=[100 200 300 400 500];
        zz=ceil(360*rand(1));
%         zzz=ceil(360*rand(1));
        theta = zz; % divide the circle angle
        x1 = 300+r1*cosd(theta); % x component
        y1 = 300+r1*sind(theta);
        
        
        for i =1:600
            for j=1:600
                bright=0;
                for z=1:length(x1)
                    bright = bright+1/((i-600*rand(1))^2+(j-600*rand(1))^2+10^2);
                end
%                     for zz=1:rem(k,9)
%                         if x2(rem(k-1,9)+1)-100*(zz-1)>=600 
%                             continue
%                         elseif x2(rem(k-1,9)+1)-100*(-zz+rem(k-1,9)+1)>=600 
%                             continue
%                         else
%                             bright = bright+1/((i-x2(rem(k-1,9)+1)+100*(zz-1))^2+(j-x2(rem(k-1,9)+1)+100*(-zz+rem(k-1,9)+1))^2+5^2);
%                     
%                         end
%                     end
%                 for z=1:rem(k,4)+1:length(x2)
%                     for zz=1:rem(k,4)+1:length(x2)
%                         bright = bright+1/((i-x2(z))^2+(j-x2(zz))^2+5^2);
%                     end
%                 end
%                 for z=1:length(theta)
% %                     zz=ceil(60*rand(1));
%                     for r=0:450
%                         if(r*cos(theta(z))>300||r*sin(theta(z))>300)
%                             break;
%                         else
%                             bright=bright+1/((i-r*cos(theta(z))-300)^2+(j-r*sin(theta(z))-300)^2+3^2);
%                         end
%                     end
%                 end

                star(i,j,1) = (0.5*k+0.5)*bright;
                star(i,j,2) = (0.5*k+0.5)*bright;
                star(i,j,3) = (0.5*k+0.5)*c*bright;
            end
        end
%         xi=60*rand(1);
%         yi=60*rand(1);
%         for i =1:60
%             for j=1:60
%                 bright = 1/((i-xi)^2 +(j-yi)^2+(10*rand(1))^2);
%                 star(i,j,1) = a*bright+0.5*star(i,j,1);
%                 star(i,j,2) = b*bright+0.5*star(i,j,1);
%                 star(i,j,3) = c*bright+0.5*star(i,j,1);
%             end
%         end
%         for i=1:60
%             for j=1:60
%                 bright=0;
%                 for k=2:3:60 
%                     for l=2:3:60
%                         bright = bright+1/((i-k)^2 +(j-l)^2+(1)^2);
%                     end
%                 end
%                 star(i,j,1) = a*bright+0.5*star(i,j,1);
%                 star(i,j,2) = b*bright+0.5*star(i,j,1);
%                 star(i,j,3) = c*bright+0.5*star(i,j,1);
%                
%             end
%         end
        
        starmax = max(max(max(star)));
        star = star/starmax;
        image(star);
        frame=frame+1;
        mymovie=getframe();
        im = frame2im(mymovie);     %将影片动画转换为编址图像,因为图像必须是index索引图像
        [jI,map] = rgb2ind(im,256); %将真彩色图像转化为索引图像
        if k==1 &&ii==1
            imwrite(jI,map,filename,'gif','Loopcount',inf,'DelayTime',0.01);     %Loopcount只是在i==1的时候才有用
        else
            imwrite(jI,map,filename,'gif','WriteMode','append','DelayTime',0.01);%DelayTime:帧与帧之间的时间间隔
        end

    end
    star=zeros(600,600,3);
    end
end

