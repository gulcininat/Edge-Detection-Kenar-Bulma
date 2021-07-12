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
T_Low = 0.2;   % CANNY
T_High = 0.5;
B = [2, 4, 5, 4, 2; 4, 9, 12, 9, 4;5, 12, 15, 12, 5;4, 9, 12, 9, 4;2, 4, 5, 4, 2 ];
B = 1/159.* B;
A=conv2(resimsb, B, 'same');
Gx = [-1, 0, 1; -2, 0, 2; -1, 0, 1];
Gy = [1, 2, 1; 0, 0, 0; -1, -2, -1];
Filtered_X = conv2(A, Gx, 'same');
Filtered_Y = conv2(A, Gy, 'same');
arah = atan2 (Filtered_Y, Filtered_X);
arah = arah*180/pi;
pan=size(A,1);
leb=size(A,2);
for i=1:pan
    for j=1:leb
        if (arah(i,j)<0) 
            arah(i,j)=360+arah(i,j);
        end;
    end;
end;
arah2=zeros(pan, leb);
for i = 1  : pan
    for j = 1 : leb
        if ((arah(i, j) >= 0 ) && (arah(i, j) < 22.5) || (arah(i, j) >= 157.5) && (arah(i, j) < 202.5) || (arah(i, j) >= 337.5) && (arah(i, j) <= 360))
            arah2(i, j) = 0;
        elseif ((arah(i, j) >= 22.5) && (arah(i, j) < 67.5) || (arah(i, j) >= 202.5) && (arah(i, j) < 247.5))
            arah2(i, j) = 45;
        elseif ((arah(i, j) >= 67.5 && arah(i, j) < 112.5) || (arah(i, j) >= 247.5 && arah(i, j) < 292.5))
            arah2(i, j) = 90;
        elseif ((arah(i, j) >= 112.5 && arah(i, j) < 157.5) || (arah(i, j) >= 292.5 && arah(i, j) < 337.5))
            arah2(i, j) = 135;
        end;
    end;
end;
magnitude = (Filtered_X.^2) + (Filtered_Y.^2);
magnitude2 = sqrt(magnitude);
BW = zeros (pan, leb);
for i=2:pan-1
    for j=2:leb-1
        if (arah2(i,j)==0)
            BW(i,j) = (magnitude2(i,j) == max([magnitude2(i,j), magnitude2(i,j+1), magnitude2(i,j-1)]));
        elseif (arah2(i,j)==45)
            BW(i,j) = (magnitude2(i,j) == max([magnitude2(i,j), magnitude2(i+1,j-1), magnitude2(i-1,j+1)]));
        elseif (arah2(i,j)==90)
            BW(i,j) = (magnitude2(i,j) == max([magnitude2(i,j), magnitude2(i+1,j), magnitude2(i-1,j)]));
        elseif (arah2(i,j)==135)
            BW(i,j) = (magnitude2(i,j) == max([magnitude2(i,j), magnitude2(i+1,j+1), magnitude2(i-1,j-1)]));
        end;
    end;
end;
BW = BW.*magnitude2;
subplot(2,3,3), imshow(BW), title('Canny Kenar Uygulamasý'); 
for i=2:(satir-1)    % gri seviye resme yumuþatma uygulanmasý
    for j=2:(sutun-1)       
        toplam=resim(i-1,j-1)+2*resim(i-1,j)+resim(i-1,j+1)+2*resim(i,j-1)+4*resim(i,j)+2*resim(i,j+1)+resim(i+1,j-1)+2*resim(i+1,j)+resim(i+1,j+1);  
        ortalama=toplam/16;
        yumusak(i,j)=ortalama;      
    end
end
subplot(2,3,4), imshow(yumusak), title('Gaussian Blurlu Resim'); 

for i=1:satir -1
    for j=1:sutun -1
        if resim(i,j)>=thresh       
            resimsb2(i,j)=1; 
        else
            resimsb2(i,j)=0;
        end
    end
end
subplot(2,3,5), imshow(resimsb2), title('Blurlu Resmin SB Hali');
T_Low = 0.2;   % CANNY
T_High = 0.5;
B = [2, 4, 5, 4, 2; 4, 9, 12, 9, 4;5, 12, 15, 12, 5;4, 9, 12, 9, 4;2, 4, 5, 4, 2 ];
B = 1/159.* B;
A=conv2(resimsb2, B, 'same');
Gx = [-1, 0, 1; -2, 0, 2; -1, 0, 1];
Gy = [1, 2, 1; 0, 0, 0; -1, -2, -1];
Filtered_X = conv2(A, Gx, 'same');
Filtered_Y = conv2(A, Gy, 'same');
arah = atan2 (Filtered_Y, Filtered_X);
arah = arah*180/pi;
pan=size(A,1);
leb=size(A,2);
for i=1:pan
    for j=1:leb
        if (arah(i,j)<0) 
            arah(i,j)=360+arah(i,j);
        end;
    end;
end;
arah2=zeros(pan, leb);
for i = 1  : pan
    for j = 1 : leb
        if ((arah(i, j) >= 0 ) && (arah(i, j) < 22.5) || (arah(i, j) >= 157.5) && (arah(i, j) < 202.5) || (arah(i, j) >= 337.5) && (arah(i, j) <= 360))
            arah2(i, j) = 0;
        elseif ((arah(i, j) >= 22.5) && (arah(i, j) < 67.5) || (arah(i, j) >= 202.5) && (arah(i, j) < 247.5))
            arah2(i, j) = 45;
        elseif ((arah(i, j) >= 67.5 && arah(i, j) < 112.5) || (arah(i, j) >= 247.5 && arah(i, j) < 292.5))
            arah2(i, j) = 90;
        elseif ((arah(i, j) >= 112.5 && arah(i, j) < 157.5) || (arah(i, j) >= 292.5 && arah(i, j) < 337.5))
            arah2(i, j) = 135;
        end;
    end;
end;
magnitude = (Filtered_X.^2) + (Filtered_Y.^2);
magnitude2 = sqrt(magnitude);
BW = zeros (pan, leb);
for i=2:pan-1
    for j=2:leb-1
        if (arah2(i,j)==0)
            BW(i,j) = (magnitude2(i,j) == max([magnitude2(i,j), magnitude2(i,j+1), magnitude2(i,j-1)]));
        elseif (arah2(i,j)==45)
            BW(i,j) = (magnitude2(i,j) == max([magnitude2(i,j), magnitude2(i+1,j-1), magnitude2(i-1,j+1)]));
        elseif (arah2(i,j)==90)
            BW(i,j) = (magnitude2(i,j) == max([magnitude2(i,j), magnitude2(i+1,j), magnitude2(i-1,j)]));
        elseif (arah2(i,j)==135)
            BW(i,j) = (magnitude2(i,j) == max([magnitude2(i,j), magnitude2(i+1,j+1), magnitude2(i-1,j-1)]));
        end;
    end;
end;
BW = BW.*magnitude2;
subplot(2,3,6), imshow(BW), title('Blurlu Resme Canny Kenar Uygulamasý'); 

