clear

close all
clc

tic
%resim1=imread('C:\Users\TOSHIBA\Desktop\tez\krr1.png');
resim1=imread('cicek10.png');
resim1=rgb2gray(resim1);
resim1=(resim1>160);
resim1=1-resim1;
resim1=logical(resim1);
figure;imshow(resim1);
resim2=imread('cicek11.png');
resim2=rgb2gray(resim2);
resim2=(resim2>160);
resim2=1-resim2;
resim2=logical(resim2);
figure;imshow(resim2);
%----------------Sizes,-----------------------
[satir,sutSayisi]=size(resim1)
satirBirlestir=satir;
sutunBirlestir=sutSayisi;
sutSayisi=sutSayisi-1;
[satir2,sut2]=size(resim2)
artisMiktari=1;

% ortak alanı hesaplayan kod 
  for sut=0:artisMiktari:sutSayisi*2-1
     sut
     
     
      ArtisMiktari=1;
for satirlar=1:ArtisMiktari:satir*2-1
    
    if sut<sutSayisi
      resim11=resim1(:,sut2-sut:sut2);%sagdan sola hareket ediyor
      resim22=resim2(:,1:sut);%soldan saga
      elseif sut==sut2
        resim11=resim1;
        resim22=resim2;
    else
      
        
     resim11=resim1(:,1:2*sut2-(sut+1));%sagdan sola hareket ediyor
     resim22=resim2(:,sut-(sut2-2):sut2);%soldan saga
    end
    if satir>satirlar
       %Resim1 Ters kayma
        resim1ort=resim11(satir-satirlar:satir,:);
       
        %Resim 2 normal kayma
        resim2ort=resim22(1:satirlar,:);
        
        [s,t]=size(resim1ort);
         xt(1,1)=true;
         ct(1,1)=false;
         for satir1=1:s-1
             for Sutun1=1:t-1
                  xt(satir1,Sutun1)=xor(resim2ort(satir1,Sutun1), resim1ort(satir1,Sutun1));
                 ct(satir1,Sutun1)=and(resim2ort(satir1,Sutun1), resim1ort(satir1,Sutun1));
             end 
         end 
           % ortak bolge degerlendirme
         if (sum(sum(xt))==0)&&(sum(sum(ct))>0)
            disp('ortak bolge bulundu. Resim1 Ters');
            fprintf('sutun: %i,satir:%i \n',t,s);
            disp('ortak bolge bulundu. Resim2 ');
            fprintf('sutun: %i,satir:%i \n',sut-sut2,satirlar-satir2);
           disp(',1.Test ');
           y(1:50,1:50,:)=resim1ort(s,t);
           y=uint8(y);
           figure;imshow(resim1ort(:,:));
            figure;imshow(resim2ort(:,:));
             test=1;             
         end
   
    elseif satirlar==satir
           resim1ort=resim11;
           resim2ort=resim22;
           
           xt(1,1)=true;
           ct(1,1)=false;
           [s,t]=size(resim1ort);
           for satir1=1:s-1
             for Sutun1=1:t-1
                
                  xt(satir1,Sutun1)=xor(resim2ort(satir1,Sutun1), resim1ort(satir1,Sutun1));
                 ct(satir1,Sutun1)=and(resim2ort(satir1,Sutun1), resim1ort(satir1,Sutun1));
             end 
         end 
           % ortak bolge degerlendirme
         if (sum(sum(xt))==0)&&(sum(sum(ct))>0)
           disp('ortak bolge bulundu.Resim1 ');
           fprintf('sutun: %i,satir:%i \n',t,s);
            disp('ortak bolge bulundu.Resim2 ');
           fprintf('sutun: %i,satir:%i \n',sut-sut2,satirlar-satir2);
           disp(',2.Test ');
             %BURADAN DEVAM ET
         end
          clear xt ct
    else
     resim1ort=resim11(1:2*satir2-satirlar,:);
     
     resim2ort=resim22(satirlar-(satir2-1):satir2,:);
     
         xt(1,1)=true;
         ct(1,1)=false;
         [sr,st]=size(resim1ort);
         
            for satir1=1:sr
             for Sutun1=1:st-1
                
                  xt(satir1,Sutun1)=xor(resim2ort(satir1,Sutun1), resim1ort(satir1,Sutun1));
                 ct(satir1,Sutun1)=and(resim2ort(satir1,Sutun1), resim1ort(satir1,Sutun1));
             end 
         end 
           % ortak bolge degerlendirme
         if (sum(sum(xt))==0)&&(sum(sum(ct))>0)
            disp('ortak bolge bulundu. resim1 ');
            st3rsm2=Sutun1;
            sr3rsm2=satir1;
           fprintf('sutun: %i,satir:%i\n \n',Sutun1,satir1);
            disp('ortak bolge bulundu. resim2 ');
            st3rsm1=sut-sut2;
            sr3rsm1=satirlar-satir2;
           fprintf('sutun: %i,satir:%i \n',sut-sut2,satirlar-satir2);
           disp(',3.Test ');
            figure;imshow(resim1ort(:,:));
            figure;imshow(resim2ort(:,:));
            test=3;
         end
          clear xt ct
    end
end
%-------------------------------------------------------------------------
      %birinci bolge
   if sut<sutSayisi
       
      resim1ort=resim1(:,sut2-sut:sut2);%sagdan sola hareket ediyor
      resim2ort=resim2(:,1:sut);%soldan saga
         xt(1,1)=true;
         ct(1,1)=false;
          % Ortak Alan Karsilastirma proseduru
          %sakai:satır indeksi
          %sukai:sutun indeksi 
           for Satir=1:satir2
             for Sutun=1:sut
                 %sabit resim: resim2
                 %kayan resim: resim1
     
                 xt(Satir,Sutun)=xor(resim2ort(Satir,Sutun), resim1ort(Satir,Sutun));
                 ct(Satir,Sutun)=and(resim2ort(Satir,Sutun), resim1ort(Satir,Sutun));
             end 
           end

         % ortak bolge degerlendirme
         if (sum(sum(xt))==0)&&(sum(sum(ct))>0)
            disp('ortak bolge bulundu. resim1 ');
           fprintf('sutun: %i,satir:%i\n \n',Sutun1,satir1);
            disp('ortak bolge bulundu. resim2 ');
           fprintf('sutun: %i,satir:%i \n',sut-sut2,satirlar-satir2);
           disp(',4.Test ');
         end

         clear xt ct           
      
   elseif sut==sut2
           resim1ort=resim1;
           resim2ort=resim2;
           
           xt(1,1)=true;
           ct(1,1)=false;
           % Ortak Alan Karsilastirma proseduru
           %sakai:satır indeksi
           %sukai:sutun indeksi 
           for Satir=1:satir2
             for Sutun=1:sut
                 %sabit resim: resim2
                 %kayan resim: resim1
     
                 xt(Satir,Sutun)=xor(resim2ort(Satir,Sutun), resim1ort(Satir,Sutun));
                 ct(Satir,Sutun)=and(resim2ort(Satir,Sutun), resim1ort(Satir,Sutun));
             end 
           end

         % ortak bolge degerlendirme
         if (sum(sum(xt))==0)&&(sum(sum(ct))>0)
            disp('ortak bolge bulundu. resim1 ');
           fprintf('sutun: %i,satir:%i\n \n',Sutun1,satir1);
            disp('ortak bolge bulundu. resim2 ');
           fprintf('sutun: %i,satir:%i \n',sut-sut2,satirlar-satir2);
           disp(',5.Test ');
         end

           clear xt ct
       else
   %ikinci bölge
     resim1ort=resim1(:,1:2*sut2-(sut+1));%sagdan sola hareket ediyor
     resim2ort=resim2(:,(sut+2)-sut2:sut2);%soldan saga
     szR1=size(resim1ort);
     st=szR1(1,2);
         xt(1,1)=true;
         ct(1,1)=false;
          % Ortak Alan Karsilastirma proseduru
          %sakai:satır indeksi
          %sukai:sutun indeksi 
           for Satir=1:satir2
             for Sutun=1:st
                 %sabit resim: resim2
                 %kayan resim: resim1
     
                 xt(Satir,Sutun)=xor(resim2ort(Satir,Sutun), resim1ort(Satir,Sutun));
                 ct(Satir,Sutun)=and(resim2ort(Satir,Sutun), resim1ort(Satir,Sutun));
             end 
           end

         % ortak bolge degerlendirme
         if (sum(sum(xt))==0)&&(sum(sum(ct))>0)
            disp('ortak bolge bulundu. resim1 ');
           fprintf('sutun: %i,satir:%i\n \n',Sutun1,satir1);
            disp('ortak bolge bulundu. resim2 ');
           fprintf('sutun: %i,satir:%i \n',st-sut2,satirlar-satir2);
           disp(',6.Test ');
         end
clear xt ct
     
   end
  end
 
%Iki resim birlestirme islemleri
if(test==3)
y=zeros(500,500,1);
y(201:200+satirBirlestir,201:200+sutunBirlestir,:)=resim1;
y(201-satir2+sr3rsm2:200+sr3rsm2,201-sut2+st3rsm2:200+st3rsm2,:)=resim2;
figure;imshow(y);
end
   disp('Bitti');
toc