clc
clear all
% % % 
% % % Eski_Grnt=imread('cameraman.tif');
% % % esikdegeri=70;
% % % 
% % % kopya=Eski_Grnt;
% % % % kopya=vertcat(kopya, kopya(end, :));     % görüntünün son satýrýný yeniden ekle
% % % % kopya=horzcat(kopya, kopya(:, end));     % görüntünün son sütununu yeniden ekle
% % % satir=size(kopya, 1);                    % satir=6
% % % sutun=size(kopya, 2);                    % sütun=6
% % % Yeni_Grnt=zeros(satir-1, sutun-1);       % Yeni_Grnt matrisi 5x5 lik
% % % 
% % % for i=1:satir-1    
% % %     for j=1:sutun-1
% % %         yenipiksel(i,j)= abs( kopya(i,j) - kopya(i+1,j+1)) + abs( kopya(i+1,j) - kopya(i,j+1) );
% % %         if ( yenipiksel(i,j) > esikdegeri)
% % %             Yeni_Grnt(i,j)=1;
% % %         else
% % %             Yeni_Grnt(i,j)=0;
% % %         end
% % %     end
% % % end
% % % figure, subplot(1,2,1), imshow(Eski_Grnt);
% % % subplot(1,2,2), imshow(Yeni_Grnt);














