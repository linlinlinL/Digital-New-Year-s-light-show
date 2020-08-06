function [a] = onestar(b)
    filename='D:\\Matlab\\bin\\star.gif';
    frame = 1; % current frame 
    r1 = 15; % light source in a circle ,radious is r1
    for k=1:50 %loop differrent images
        xx1=300*(rand(1)-0.5)+300;
        yy1=300*(rand(1)-0.5)+300;
        r1 = 50+150*rand(1);
        theta = 20*rand(1)*360/20 ; % divide the circle angle
        x1 = xx1+r1*cosd(theta); % x component
        y1 = yy1+r1*sind(theta);
        a=rand(1);
        b=rand(1);
        c=rand(1);
        for i =1:600
            for j=1:600
                bright = 1/((i-x1)^2 +(j-y1)^2+(50+100*rand(1))^2);
                star(i,j,1) = a*bright;
                star(i,j,2) = b*bright;
                star(i,j,3) = c*bright;
            end
        end
        starmax = max(max(max(star)));
        star = star/starmax;
        image(star);
        frame=frame+1;
        mymovie=getframe();
        im = frame2im(mymovie);     %将影片动画转换为编址图像,因为图像必须是index索引图像
        [jI,map] = rgb2ind(im,256); %将真彩色图像转化为索引图像
        if k==1 ;
            imwrite(jI,map,filename,'gif','Loopcount',inf,'DelayTime',0.01);     %Loopcount只是在i==1的时候才有用
        else
            imwrite(jI,map,filename,'gif','WriteMode','append','DelayTime',0.01);%DelayTime:帧与帧之间的时间间隔
        end
    end
end

