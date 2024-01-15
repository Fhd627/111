clear all
close all
clc
 
 
%pluto rx ����
rxPluto  = sdrrx('Pluto');
rxPluto.CenterFrequency = 2400000000;   %��������Ƶ�� 2.4GHz
rxPluto.BasebandSampleRate = 18e6;      %���ò����� ��10MHz
rxPluto.SamplesPerFrame = 1024 ;        %���ò�������:1024
 
 
fs  =  rxPluto.BasebandSampleRate ;     
N   =  rxPluto.SamplesPerFrame ;        
freq = (-N/2:N/2-1)/N* fs/1000000 ;     
 
 
 
 
% �����ź�
% data���յ����źţ�datavalidָʾ�����Ƿ���Ч��overflowָʾ�����Ƿ������
[data,datavalid,overflow] = rxPluto();  %���� pluto�������ݽ���
 
 
XK  =   fft( data );                    %fft�任
 
 
figure(1);
plot(freq,20*log10( fftshift(abs( XK )) ) );  %�������ݵ�Ƶ��
 
 
figure(2);
plot(real(data)); hold on;  %��������ʵ��
plot(imag(data));           %���������鲿
 %%
 %  (%{...}%�Ƕ�ע��)
 %{
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
%}

