function img_rgb2 = Int_img(img_rggb,ng)

[lv, lu] = size(img_rggb);
img_rgb2 = zeros(lv,lu,3);

%Matriz de recuperacion de rojo
img_rgb2(1:2:lv,1:2:lu,1) = img_rggb(1:2:lv,1:2:lu);
%Matriz de Recuperacion de verde
img_rgb2(1:2:lv,2:2:lu,2) = img_rggb(1:2:lv,2:2:lu);
img_rgb2(2:2:lv,1:2:lu,2) = img_rggb(2:2:lv,1:2:lu);
%Matriz de recuperacion de Azul
img_rgb2(2:2:lv,2:2:lu,3) = img_rggb(2:2:lv,2:2:lu);


%{
for i1 = 1:lv
    for i2=1:lu
        if(mod(i1,2))
            if(mod(i2,2))
                img_rgb2(i1,i2,1) = img_rggb(i1,i2);
            else
                img_rgb2(i1,i2,2) = img_rggb(i1,i2);
            end
        else
            if(mod(i2,2))
                img_rgb2(i1,i2,2) = img_rggb(i1,i2);
            else
                img_rgb2(i1,i2,3) = img_rggb(i1,i2);
            end
        end
    end
end
%}
%% interpolacion de  valores

pv = ng+mod(ng,2);
V = pv.^[ng:-1:0];
MT = inv((((2*ng+1):-2:1)').^((ng:-1:0)));
%MT = [1,1,1,1;81,9,3,1;125,25,5,1;343,49,7,1];
id1 = 1-pv;
id2 = pv +1 -2*mod(ng,2);
for i1 =pv:(lv-pv+mod(ng,2)-1)
    for i2 = pv:(lu-pv+mod(ng,2)-1)
        
        if(~mod(i1,2))
            if(~mod(i2,2))
                %img_rgb2(i1,i2,2)=V*(MT\[img_rgb2(i1,i2-3,2);img_rgb2(i1,i2-1,2);img_rgb2(i1,i2+1,2);img_rgb2(i1,i2+3,2)]);
                img_rgb2(i1,i2,2)=V*(MT*img_rgb2(i1,i2+id1:2:i2+id2,2)');
            else
                img_rgb2(i1,i2,1)=V*(MT*img_rgb2(i1+id1:2:i1+id2,i2,1));
                img_rgb2(i1,i2,3)=V*(MT*img_rgb2(i1,i2+id1:2:i2+id2,3)');
            end
        else
            if(~mod(i2,2))
                img_rgb2(i1,i2,1)=V*(MT*img_rgb2(i1,i2+id1:2:i2+id2,1)');
                img_rgb2(i1,i2,3)=V*(MT*img_rgb2(i1+id1:2:i1+id2,i2,3));
            else
                img_rgb2(i1,i2,2)=V*(MT*img_rgb2(i1,i2+id1:2:i2+id2,2)');
            end
        end 
    end
end

for i1 =pv:(lv-pv+mod(ng,2)-1)
    for i2 = pv:(lu-pv+mod(ng,2)-1)
        if(~mod(i1,2))
            if(~mod(i2,2))
               img_rgb2(i1,i2,1) = V*(MT*img_rgb2(i1,i2+id1:2:i2+id2,1)');
                
            end
        else
            if(mod(i2,2))
                img_rgb2(i1,i2,3) = V*(MT*img_rgb2(i1,i2+id1:2:i2+id2,3)');
                
            end
        end 
    end
end
%% Muestra resultado
img_rgb2 = uint8(img_rgb2);% Tranformacion de flotante a entero
