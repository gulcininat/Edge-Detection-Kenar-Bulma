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
for i=2:satir-1                         % laplacian kenar uygulamasý
    for j=2:sutun-1 
        lap(i,j)=( -resimsb(i-1,j)-resimsb(i,j-1)+4*resimsb(i,j)-resimsb(i,j+1)-resimsb(i+1,j) );      
    end 
end
subplot(2,3,3), imshow(lap), title('Laplacian Kenar Uygulamasý');     
for i=2:(satir-1)    % gri seviye resme yumuþatma uygulanmasý
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
for i=2:satir-2                         % yumusamýþ resme laplacian kenar uygulamasý
    for j=2:sutun-2   
        lap2(i,j)=( -resimsb2(i-1,j)-resimsb2(i,j-1)+4*resimsb2(i,j)-resimsb2(i,j+1)-resimsb2(i+1,j) );
%        lap2(i,j)=( -resimsb2(i-1,j-1)-resimsb2(i-1,j)-resimsb2(i-1,j+1)-resimsb2(i,j-1)+8*resimsb2(i,j)-resimsb2(i,j+1)-resimsb2(i+1,j-1)-resimsb2(i+1,j)-resimsb2(i+1,j+1) );
% %         if (lap2(i,j)~= 0)
% %             lap2(i,j)=1;
% %         end      
    end 
end
subplot(2,3,6), imshow(lap2), title('Blurlu Resme Laplacian Kenar Uygulamasý');