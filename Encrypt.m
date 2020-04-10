function [ result ] = Encrypt( key, message )
the_key=key;
result = the_key*message;
result = mod(result,92);
end