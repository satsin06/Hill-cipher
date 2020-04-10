function [ destr] = Hill_Cipher()
message = input('Input Message without spaces: ', 's');
len = length(message);
f = 1;
while f==1
    disp('Enter The Key');
    for i=1:3
        for j=1:3
            key(i,j)=input('element-');
        end
    end
    detkey = det(key); 
    if mod(detkey,2)==0
        disp('enter key with odd determinant');
        f=1;
    else
        f=0;
    end
end
amessage = double(message);
modlen = mod(len,3);
if mod(len,3) ~= 0
    for i=1:3 - mod(len,3)
        amessage(1,len+i) = 32;
    end
end
bmessage = reshape(amessage, 3, ceil(len/3));
for i=1:ceil((len/3))
    for j=1:3
        bmessage(j,i)= bmessage(j,i)-33;
    end
end
en_message = Encrypt(key,bmessage);
twoen_message = en_message;
for i=1:ceil(len/3)
    for j=1:3
        en_message(j,i)= en_message(j,i)+33;
    end
end
enstr = reshape(char(en_message),1,j*i);
disp(enstr);
de_message = Decrypt(key,twoen_message);
for i=1:ceil(len/3)
    for j=1:3
        de_message(j,i)= de_message(j,i)+33;
    end
end
destr = reshape(char(de_message),1,j*i);
if modlen ~= 0
    destr = destr(1:len);
end
end