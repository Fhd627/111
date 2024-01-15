clear all
close all
clc
 
CenterFrequency    =    1000000000 ;    %����Ƶ�� 1GHZ
BasebandSampleRate =  30.72e6 ;         %���������� 30.72MHz
 
txPluto  = sdrtx('Pluto');
txPluto.RadioID =  'usb:0' ;
txPluto.CenterFrequency  =  CenterFrequency ;      
txPluto.BasebandSampleRate =  BasebandSampleRate  ;        
txPluto.ChannelMapping     = 1;
txPluto.Gain = 0 ;                          %���������
 
%%�����ź�
%���������ʣ�30.72MHz
%�����ź�Ƶ�� 10KHz
%������65536
fc = 100e3;                  %�����ź�Ƶ�� 10KHz
fs = BasebandSampleRate;    
N =  65536*2 ;
t = (1:N)/fs ;
f = fs*(0:N-1)/N  ;
 
input=exp(1i*2*pi*fc*t )'; 
 
 
figure(1);
plot(t,real(input));
figure(2);
plot( f  , 20*log10( abs(   fft(input) )  ) ) ;
%%��������
%����100��
for a = 0:2000 
  txPluto(input); 
end