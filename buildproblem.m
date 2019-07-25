function [A,r] = buildproblem (states, factor)

pose_size = 3;
motion_size = 3;
lmk_size = 2;

%
n_poses_st = 3;
n_lmks_st = 4;
n_poses_f = 1;
n_motion_f = 2;
n_lmks_f = 8;


K = numel(factor);

A = zeros(...
    n_poses_f*pose_size + n_motion_f*motion_size + n_lmks_f*lmk_size,...
    n_poses_st*pose_size + n_lmks_st*lmk_size);

    %és el que serà J * Wt*(-1/2)
    %17 es pose_size*num_poses + lmk_size*num_lmks
    %faltaria trobar una manera de calcular el 25 pero no hem definit
    %variables pels factors

r = zeros(1*3+2*3+8*2, 1);    

row = 1;

for k = 1:K
        
    y= factor{k}.measurement;
    W= factor{k}.covariance^-1;
    Wt2 = chol(W, 'upper'); %Arrel quadrada de Wt2, (Wt)^(-1/2)
    
    switch factor{k}.type
        case 'motion'
            i= factor{k}.index(1);
            j= factor{k}.index(2);
            rob1= states{i + 1}; %hem de posar +1 perque haviem definit els estats començant pel 0 (que matlab no ho accepta)
            rob2= states{j + 1};
            [e, J_e_rob1, J_e_rob2] = error_move(rob1.value, rob2.value, y);
            
            rows = [row : (row + numel(y) -1)];
            
            r(rows) = Wt2 * e;
            
            A(rows, rob1.range) = Wt2 * J_e_rob1;
            A(rows, rob2.range) = Wt2 * J_e_rob2;
                                 
        case 'lmk'
            i= factor{k}.index(1);
            j= factor{k}.index(2);
            rob= states{i + 1};
            lmk= states{j + 1};
            k
            [e, J_e_rob, J_e_lmk] = error_observe(rob.value, lmk.value, y);
            
            rows = [row : (row + numel(y) -1)];
            
            r(rows) = Wt2 * e;
            
            A(rows, rob.range) = Wt2 * J_e_rob;
            A(rows, lmk.range) = Wt2 * J_e_lmk;
            
        case 'pose'
            i = factor{k}.index(1);
            rob= states{i + 1};
            [e, J_e_rob]= error_pose(rob.value, y);
            rows = [row : (row + numel(y) -1)];
            r(rows) = Wt2 * e;
            Wt2
            J_e_rob
            A(rows, rob.range) = Wt2 * J_e_rob;
      
    end
    
    row = row + numel(y);
    
end