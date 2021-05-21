function [minfreq,maxfreq] = classify(Filename)
% "����������" �� ���������� Naive Bayes ��� ��� ���������������  
% �� 2 ������� (���� �, ���� ��.�) ������� �� ��� "���������"


%������������ �������� ������� ����� ��� ���������� ��� ������� �� �� "�����" ������� ��� ��� ����
  ida = {'Hxosa1','Hxosa2','Hxosa3','Hxosa4','Hxosa5','Hxosa6','Hxosa7'};
%aValueSet = {'����� �������� ���� � ������������(�����)','������������ ���� � ������������(�����)','� �������-��� ��������� ���� ����� ���� � ������������ (�����)'
%,'� �������-��������� ���� ���� ���� � ������������ (�����)','� �������-����� ���� ��������� ���� � ������������ (�����)','���� ���� ���� � ������������ (�����)'
%,'������� ����� ���� � ������������ (�����)'};       %������� value set ���� ����� ������������ ���� ����� greeklish...
  Valuea = {'kyrie ekekraja','Kateyuynuhtw ','A stixhro','B stixhro','G stixhro','Pasa pnoh','Aineitai ayton'};
%�������� ������� ��� �� keySet, �� ������ ��������������� �� ��� ���������� ���� ��� �� valueSet.
%�� �������� ������� keySet ��� valueSet ����� ��� ���� ������ ��������� ��� �� keySet �� ���� �������� ��������. 
  titlesa = containers.Map(ida,Valuea); 


%������������ �������� ������� ����� ��� ��� ��. �' ���
  idpld = {'Hxospld1','Hxospld2','Hxospld3','Hxospld4','Hxospld5','Hxospld6','Hxospld7'};
  Valuepld = {'kyrie ekekraja','Kateyuynuhtw ','A stixhro','B stixhro','G stixhro','Pasa pnoh','Aineitai ayton'};
  titlespld = containers.Map(idpld,Valuepld); 


%������� "���������" ��� �� 7 ��. ������ �� � ���
  c=cell(2,7); % ������� ������ 7 ������, ���� ���� ������ �� �������� ������������ ���� ���������. 
  for i=1:7
    c(1,{i})=audioread(sprintf('Hxosa%i.wav',i)); %�������� �� ������� ������, ��� 1� ���� i=1 ��� �� ������ �� ����� Hxosa1.wav ��� ������� ���� ���� ������ �� �� ���������
                                               %��� ����� ��� cell to 'sample' ��� �� FS
% ��� �� ������ �� ������������ ����� , � ��������� ��� � ���������� ��������� ��� �������� �������
    value{i} = fft(c{i});
    Hxosa_freq{i}= mean(value{i});  %����� ���� ��� ���������� ��� �� 7 ������� ������ �� ����  
    %Hxosa_freq_Rounded{i}=round(Hxosa_freq{i}*100)/100; %��������������� ��� ���������� ��� �����
    %aFreq=cell2mat (Hxosa_freq_Rounded);
  end    

%���������� ��� �� ������� ������ ��� ����� �� ��� ��.�
  c=cell(1,7);
  for i=1:7
    c(1,{i})=audioread(sprintf('Hxospld%i.wav',i));
    value{i} = fft(c{i});
    Hxospld_freq{i}= mean(value{i});
    %Hxospld_freq_Rounded{i}=round(Hxospld_freq{i}*100)/100;
    %pldFreq=cell2mat (Hxospld_freq_Rounded);
  end    


%�������� ��� ���� �������� ��������� ��� �������� �������� ����� ������� �� ��� �������� ��� ������� ��������� �� ��� � � ��. �:
  [sample,FS]=audioread(Filename);

% ��� ���� ���������� ������ �����������....
  value = fft (sample);
  freq= mean(value);
  %minfreq =....
  %maxfreq = ... 
 % To minfreq ��� maxfreq ����� �� ���������� ��� ���������� ��� �� �� ������� ���� ���� ��� ��� ��������
  

endfunction



