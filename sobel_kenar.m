clc
clear all
resim=imread('C:/Users/user/Desktop/lenaa.png');
resim=rgb2gray(resim);
resim=im2double(resim);
satir= size(resim,1); 
sutun= size(resim,2); 
thresh=0.4;                              % siyah beyaza döndürme
for i=1:satir 
    for j=1:sutun 
        if resim(i,j)>=thresh       
            resimsb(i,j)=1; 
        else
            resimsb(i,j)=0;
        end
    end
end
figure, subplot(2,3,1), imshow(resim), title('Orjinal Resim');
subplot(2,3,2), imshow(resimsb), title('SB Resim');
% sobel=ones(satir,sutun);
for i=2:satir-1                         % sobel kenar uygulaması
    for j=2:sutun-1       
        Gx=( (resimsb(i-1,j-1)+2*resimsb(i,j-1)+resimsb(i+1,j-1)) - (resimsb(i-1,j+1)+2*resimsb(i,j+1)+resimsb(i+1,j+1)) ); %Yatay sobel  
        Gy=( (resimsb(i-1,j-1)+2*resimsb(i-1,j)+resimsb(i-1,j+1)) - (resimsb(i+1,j-1)+2*resimsb(i+1,j)+resimsb(i+1,j+1)) ); %Dikey sobel
        sobel(i,j)=abs(Gx)+abs(Gy);
        if (sobel(i,j)~= 0)
            sobel(i,j)=1;
        end      
    end 
end
subplot(2,3,3), imshow(sobel), title('Sobel Kenar Uygulaması');         
for i=2:(satir-1)    % gri seviye resme yumuşatma uygulanması
    for j=2:(sutun-1)       
        toplam=resim(i-1,j-1)+2*resim(i-1,j)+resim(i-1,j+1)+2*resim(i,j-1)+4*resim(i,j)+2*resim(i,j+1)+resim(i+1,j-1)+2*resim(i+1,j)+resim(i+1,j+1);  
        ortalama=toplam/16;
        yumusak(i,j)=ortalama;      
    end
end
subplot(2,3,4), imshow(yumusak), title('Gaussian Blurlu Resim');     
for i=1:satir-1                      % siyah beyaza döndürme
    for j=1:sutun-1 
        if yumusak(i,j)>=thresh       
            resimsb2(i,j)=1; 
        else
            resimsb2(i,j)=0;
        end
    end
end
subplot(2,3,5), imshow(resimsb2), title('Blurlu Resmin SB Hali');
for i=2:satir-2                         % yumusamış resme sobel kenar uygulaması
    for j=2:sutun-2      
        Gx=( (resimsb2(i-1,j-1)+2*resimsb2(i,j-1)+resimsb2(i+1,j-1)) - (resimsb2(i-1,j+1)+2*resimsb2(i,j+1)+resimsb2(i+1,j+1)) ); %Yatay sobel  
        Gy=( (resimsb2(i-1,j-1)+2*resimsb2(i-1,j)+resimsb2(i-1,j+1)) - (resimsb2(i+1,j-1)+2*resimsb2(i+1,j)+resimsb2(i+1,j+1)) ); %Dikey sobel
        sobel2(i,j)=abs(Gx)+abs(Gy);
        if (sobel2(i,j)~= 0)
            sobel2(i,j)=1;
        end      
    end 
end
subplot(2,3,6), imshow(sobel2), title('Blurlu Resme Sobel Kenar Uygulaması');

% for i=2:(satir-1)    % gri seviye resme yumuşatma uygulanması  ortlaam
% filtre
%     for j=2:(sutun-1)
%         toplam=resim(i-1,j-1)+resim(i-1,j)+resim(i-1,j+1)+resim(i,j-1)+resim(i,j)+resim(i,j+1)+resim(i+1,j-1)+resim(i+1,j)+resim(i+1,j+1);  
%         ortalama=toplam/9;
%         yumusak(i,j)=ortalama;      
%     end
% end
% subplot(2,3,4), imshow(yumusak), title('Blurlu Resim'); 

% gaussian 5x5 blur
%         toplam=resim(i-2,j-2)+4*resim(i-2,j-1)+6*resim(i-2,j)+4*resim(i-2,j+1)+resim(i-2,j+2)+4*resim(i-1,j-2)+16*resim(i-1,j-1)+24*resim(i-1,j)+16*resim(i-1,j+1)+4*resim(i-1,j+2)+6*resim(i,j-2)+24*resim(i,j-1)+36*resim(i,j)+24*resim(i,j+1)+6*resim(i,j+2)        +4*resim(i+1,j-2)+16*resim(i+1,j-1)+24*resim(i+1,j)+16*resim(i+1,j+1)+4*resim(i+1,j+2)  +resim(i+2,j-2) +4*resim(i+2,j-1)+6*resim(i+2,j)+4*resim(i+2,j+1)+resim(i+2,j+2);  
%ortalama=toplam/256;