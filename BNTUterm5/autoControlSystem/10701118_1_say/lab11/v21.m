clear all;
clc;
K = 1;                                     %��������� ������
T = 19;                                    %����� �������������
s = tf('s');                               %�������� �������
W = K/(s^3 + 0.1*s^2 + 0.1*s + 1)     %������ ������� � Matlab'�
W1 = 1;
Wr = W*W1                                       %������������ ������� ����������� �������
Wz = feedback(Wr, 1)                     %������������ ������� ��������� �������

% ���������� ����������  ������� ����������� �������

figure(1);
step(W, T);
grid on;

% ���������� ����������  ������� ��������� �������

figure(2);
step(Wz, T);
grid on;

% ���������� ������� (������)������������ �������

display('����� ������������������� ���������');
polusa = pole(Wz)

%��������� ������������� ������������������� ��������
%�������� �������� � ����������� ������������ ������� ��������� �������

display('������������ ������������������� ���������');
lm = poly(polusa)


%������� �������
display('������� �������');
A = [lm(2), lm(4), 0;
     lm(1), lm(3), 0;
     0,     lm(2), lm(4);]
 
display('������������ ������� �������');
det(A)

display('������ ����� ������� �������');
A1 = [lm(2)]
det(A1)

display('������ ����� ������� �������');
A2 = [lm(2), lm(4);
      lm(1), lm(3)]
 det(A2)
 
display('������ ����� ������� �������');
A3 = [lm(2), lm(4), 0;
      lm(1), lm(3), 0;
      0,     lm(2), lm(4);]
det(A3)


%�������� ���������
figure(3);
nyquist(Wr);
grid on;

%��������� ���������
figure(4);
w = 0:0.01:2.5;
yr = j^3*w.^3 + 0.1*j^2*w.^2 + 0.1*j*w + 2;
x = real(yr);
y = imag(yr);
plot(x, y);
grid on;