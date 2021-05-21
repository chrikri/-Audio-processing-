##�������� ��� ��������� ���� ���������� ������������ ������� ��� ���� :ByzEchosRecognition
##������� ��� ������ ����������� ������� ��� ����
## Author: Christiana Krielesi p2017129
## 2021-05-21
%��������� ���� ���������� ��� ������� ��� ������� ������ �� ������ ����� ���������� �������� ��� ��� ������ 
%��� ��� �������� ���� �� ���������� ��� ��� ���� ����� ������ ��� �� ������� ��� ������ ��� ������������������ 
%���� ���� ��� ��� �������� ���� ��� �.�. ��� ����������.



printf ("\nWelcome! \n This is a system that accepts an audio file of a Byzantine music psalm and recognizes \nto which echos (����) it belongs.\n More, it suggests some other psalms that are categorized into the same sound that exists within the system. \n");
Filename =input ("\nEnter the audio file name (in .wav format) : \n" , "s")

  %if strcmp(Filename,'*.wav')==1 %������� ��� �� �� ��� ���� ����� ��� ���� ��� ��.������� �� .wav
  %else 
  %  Filename =input ("\nPlease give a audio file with .wav format! : \n" , "s")
  %endif

    c(1,{i})=audioread(sprintf('Hxospld%i.wav',i));

% ������ ��� �������� �� ��� ���� ��� ��� ���������� ��� �� ������ ���� ��� �������� ���������
%������� ��� ��� �� ��� �,������� �� ��� ���� ��� ��� ������ ��� : minfreq =262 maxfreq = 523
% ������� ��� �� ��� ��.�,������� �� ��� ���� ��� ��� ������ ��� : minfreq =288 maxfreq = 576
% �� ���� ����� ��� ��������� ���� ���� �������� ��������


classify(Filename);

    %��� ���������� minfreq ��� maxfreq ��� ��������� ��� ��� ��������� classify
  if (minfreq>258 && minfreq<267) &&  (maxfreq>520 && minfreq<525)  %������ �� ������ ��� ����� � ������� ��������� ���� �������� ������� ��� ��� ����� ����� 
                                                           %������� �� ��� ���������� �� ����� �������� ��� ��������� ��� ������ �� ������� 
    message1 = sprintf('This hymn belongs to the echo (���) --> �');
  
  %���� ��� �� ������� ���� ��� �������� ������� ��� ���� � "�.�." ��� ����������...��� ���� ��� ����
  %������� �� container map ��� ����, ��� �� ������ �� ��� ���� ������� ��� ������ ��� ������� ����������� ����
  % ���� �� ���� ����� ������ (�������,����������� ���.)(valuea) ��� �� ����� �� �� ����� ������� ���� ��� �.�.(ida)
  % (���� ��������� �� ��������� ��������� ��� ��������� � ���������� �� ������ ��� �� ������ � �������
  %���� ������� ��� ���� ��������� )
  %ida(titlesa),Valuea(titlesa)
    msgbox(message1); %�������� �� ����� ������� ��������, ���� �� �������
  
  else message2 = sprintf('This hymn belongs to the echo (���) --> ������ �.')
    % idpld(titlespl),Valuepld(titlespld);
    msgbox(message2);
  endif

