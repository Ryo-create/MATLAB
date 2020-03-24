function out = repair(in1,in2)
imtool close all
I=imread(in1);
hI=imtool(I,'InitialMagnification','fit');
[CI,rect]=imcrop(hI);
imtool close all
rect=int16(rect);
C1=I;
C1(rect(2):rect(2)+rect(4),rect(1):rect(1)+rect(3),:)=0;
imtool(C1,'InitialMagnification','fit');
I2=imread(in2);
a1=0;a2=0;a3=0;
while a1 < rect(4) || a2 < rect(3)
    if a3 == 1
        disp('‚à‚¤­‚µ‘å‚«‚¢”ÍˆÍ‚Å‰æ‘œ‚ð’Šo‚µ‚Ä‚­‚¾‚³‚¢B')
    end
    hI2=imtool(I2,'InitialMagnification','fit');
    [CI2,rect2]=imcrop(hI2);
    rect2=int16(rect2);
    a1=rect2(4);
    a2=rect2(3);
    a3=1;
end
zC=C1;
zC(:,:,:)=0;
for c = 1:size(C1,1)
    for d = 1:size(C1,2)
        if rect(2)-1 < c && c < rect(2)+rect(4)+1
            if rect(1)-1 < d && d < rect(1)+rect(3)+1
                zC(c,d,:) = I2(rect2(2)+(c-rect(2)),rect2(1)+(d-rect(1)));
            end
        end
    end
end
imtool close all
imtool(C1,'InitialMagnification','fit');
imtool(zC,'InitialMagnification','fit');
U=C1+zC;
out=imtool(U,'InitialMagnification','fit');
end

