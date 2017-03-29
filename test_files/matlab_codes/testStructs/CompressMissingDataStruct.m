classdef CompressMissingDataStruct
   properties (Constant)
       
       GRNstruct_with_no_NaN = struct( ...
         'rawExpressionData', struct(...
             't', struct ('indx', {[1 2 3]; [4 5 6]; [7 8 9]}, 't', {0.4; 0.8; 1.2}), ...
             'data', {[0.4	0.4	0.4	0.8	0.8	0.8	1.2	1.2	1.2;...
                      -0.376334306292052	-0.376334306292052	-0.376334306292052	-0.706666467343382	-0.706666467343382	-0.706666467343382	-0.987239299670092	-0.987239299670092	-0.987239299670092;...
                      -0.227718654239836	-0.227718654239836	-0.227718654239836  -0.408017743026565	-0.408017743026565	-0.408017743026565	-0.546412653239117	-0.546412653239117	-0.546412653239117;...
                       0.269293821322375	 0.269293821322375	 0.269293821322375	 0.415935372482249	 0.415935372482249	 0.415935372482249 	 0.497511633589691	 0.497511633589691	 0.497511633589691;...
                      -0.290936155220703	-0.290936155220703	-0.290936155220703	-0.579771801563864	-0.579771801563864	-0.579771801563864	-0.85583465653557	-0.85583465653557	-0.85583465653557...
                      ];
                      [0.4	0.4	0.4	0.8	0.8	0.8	1.2	1.2	1.2;...
                      -0.376334306292052	-0.376334306292052	-0.376334306292052	-0.706666467343382	-0.706666467343382	-0.706666467343382	-0.987239299670092	-0.987239299670092	-0.987239299670092;...
                      -0.227718654239836	-0.227718654239836	-0.227718654239836	-0.408017743026565	-0.408017743026565	-0.408017743026565	-0.546412653239117	-0.546412653239117	-0.546412653239117;...
                       0                     0                   0                   0                   0                   0                   0                   0                   0;...
                      -0.13932150464649     -0.13932150464649	-0.13932150464649	-0.249851730445413	-0.249851730445413	-0.249851730445413	-0.336140688374095	-0.336140688374095	-0.336140688374095...
             ]}...
         )...
      );
  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
 
        expected_output_for_GRNstruct_with_no_NaN = struct( ...
            'expressionData', struct (...
                'data', { { 0.4 0.8 1.2;...
                          [-0.376334306292052	-0.376334306292052	-0.376334306292052; 1 2 3],	[-0.706666467343382	-0.706666467343382	-0.706666467343382; 1 2 3],	[-0.987239299670092	-0.987239299670092	-0.987239299670092; 1 2 3];...
                          [-0.227718654239836	-0.227718654239836  -0.227718654239836; 1 2 3], [-0.408017743026565	-0.408017743026565	-0.408017743026565; 1 2 3],	[-0.546412653239117	-0.546412653239117	-0.546412653239117; 1 2 3];...
                          [ 0.269293821322375	 0.269293821322375	 0.269293821322375; 1 2 3],	[ 0.415935372482249	 0.415935372482249	 0.415935372482249; 1 2 3], [0.497511633589691	 0.497511633589691	 0.497511633589691; 1 2 3];...
                          [-0.290936155220703	-0.290936155220703	-0.290936155220703; 1 2 3],	[-0.579771801563864	-0.579771801563864	-0.579771801563864; 1 2 3],	[-0.85583465653557	-0.85583465653557	-0.85583465653557;  1 2 3]...
                       };
                       { 0.4 0.8 1.2;...
                      [-0.376334306292052	-0.376334306292052	-0.376334306292052; 1 2 3],	[-0.706666467343382	-0.706666467343382	-0.706666467343382; 1 2 3],	[-0.987239299670092	-0.987239299670092	-0.987239299670092; 1 2 3];...
                      [-0.227718654239836	-0.227718654239836  -0.227718654239836; 1 2 3], [-0.408017743026565	-0.408017743026565	-0.408017743026565; 1 2 3],	[-0.546412653239117	-0.546412653239117	-0.546412653239117; 1 2 3];...
                      [ 0                    0                   0;                 1 2 3],	[ 0                  0                   0;                 1 2 3], [ 0                  0                   0;                 1 2 3];...
                      [-0.13932150464649    -0.13932150464649	-0.13932150464649;  1 2 3],	[-0.249851730445413	-0.249851730445413	-0.249851730445413; 1 2 3],	[-0.336140688374095	-0.336140688374095	-0.336140688374095; 1 2 3]...
                } }...
            ) ...
     );
       
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

       GRNstruct_with_one_NaN = struct( ...
         'rawExpressionData', struct(...
             't', struct ('indx', {[1 2 3]; [4 5 6]; [7 8 9]}, 't', {0.4; 0.8; 1.2}), ...
             'data', {[0.4	0.4	0.4	0.8	0.8	0.8	1.2	1.2	1.2;...
                      -0.376334306292052	-0.376334306292052	-0.376334306292052	-0.706666467343382	-0.706666467343382	-0.706666467343382	-0.987239299670092	-0.987239299670092	-0.987239299670092;...
                      -0.227718654239836	-0.227718654239836	 NaN                -0.408017743026565	-0.408017743026565	-0.408017743026565	-0.546412653239117	-0.546412653239117	-0.546412653239117;...
                       0.269293821322375	 0.269293821322375	 0.269293821322375	 0.415935372482249	 0.415935372482249	 0.415935372482249 	 0.497511633589691	 0.497511633589691	 0.497511633589691;...
                      -0.290936155220703	-0.290936155220703	-0.290936155220703	-0.579771801563864	-0.579771801563864	-0.579771801563864	-0.85583465653557	-0.85583465653557	-0.85583465653557...
                      ];
                      [0.4	0.4	0.4	0.8	0.8	0.8	1.2	1.2	1.2;...
                      -0.376334306292052	-0.376334306292052	-0.376334306292052	-0.706666467343382	-0.706666467343382	-0.706666467343382	-0.987239299670092	-0.987239299670092	-0.987239299670092;...
                      -0.227718654239836	-0.227718654239836	-0.227718654239836	-0.408017743026565	-0.408017743026565	-0.408017743026565	-0.546412653239117	-0.546412653239117	-0.546412653239117;...
                       0                     0                   0                   0                   0                   0                   0                   0                   0;...
                      -0.13932150464649     -0.13932150464649	-0.13932150464649	-0.249851730445413	-0.249851730445413	-0.249851730445413	-0.336140688374095	-0.336140688374095	-0.336140688374095...
             ]}...
         )...
     );
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
 
       expected_output_for_GRNstruct_with_one_NaN = struct( ...
         'rawExpressionData', struct(...
             't', struct ('indx', {[1 2 3]; [4 5 6]; [7 8 9]}, 't', {0.4; 0.8; 1.2}), ...
             'data', {[0.4	0.4	0.4	0.8	0.8	0.8	1.2	1.2	1.2;...
                      -0.376334306292052	-0.376334306292052	-0.376334306292052	-0.706666467343382	-0.706666467343382	-0.706666467343382	-0.987239299670092	-0.987239299670092	-0.987239299670092;...
                      -0.227718654239836	-0.227718654239836	 NaN                -0.408017743026565	-0.408017743026565	-0.408017743026565	-0.546412653239117	-0.546412653239117	-0.546412653239117;...
                       0.269293821322375	 0.269293821322375	 0.269293821322375	 0.415935372482249	 0.415935372482249	 0.415935372482249 	 0.497511633589691	 0.497511633589691	 0.497511633589691;...
                      -0.290936155220703	-0.290936155220703	-0.290936155220703	-0.579771801563864	-0.579771801563864	-0.579771801563864	-0.85583465653557	-0.85583465653557	-0.85583465653557...
                      ];
                      [0.4	0.4	0.4	0.8	0.8	0.8	1.2	1.2	1.2;...
                      -0.376334306292052	-0.376334306292052	-0.376334306292052	-0.706666467343382	-0.706666467343382	-0.706666467343382	-0.987239299670092	-0.987239299670092	-0.987239299670092;...
                      -0.227718654239836	-0.227718654239836	-0.227718654239836	-0.408017743026565	-0.408017743026565	-0.408017743026565	-0.546412653239117	-0.546412653239117	-0.546412653239117;...
                       0                     0                   0                   0                   0                   0                   0                   0                   0;...
                      -0.13932150464649     -0.13932150464649	-0.13932150464649	-0.249851730445413	-0.249851730445413	-0.249851730445413	-0.336140688374095	-0.336140688374095	-0.336140688374095...
             ]}...
         ),...
         'expressionData', struct (...
             'data', { { 0.4 0.8 1.2;...
                      [-0.376334306292052	-0.376334306292052	-0.376334306292052; 1 2 3],	[-0.706666467343382	-0.706666467343382	-0.706666467343382; 1 2 3],	[-0.987239299670092	-0.987239299670092	-0.987239299670092; 1 2 3];...
                      [-0.227718654239836	-0.227718654239836;                     1 2  ], [-0.408017743026565	-0.408017743026565	-0.408017743026565; 1 2 3],	[-0.546412653239117	-0.546412653239117	-0.546412653239117; 1 2 3];...
                      [0.269293821322375	 0.269293821322375	 0.269293821322375; 1 2 3],	[ 0.415935372482249	 0.415935372482249	 0.415935372482249; 1 2 3], [0.497511633589691	 0.497511633589691	 0.497511633589691; 1 2 3];...
                      [-0.290936155220703	-0.290936155220703	-0.290936155220703; 1 2 3],	[-0.579771801563864	-0.579771801563864	-0.579771801563864; 1 2 3],	[-0.85583465653557	-0.85583465653557	-0.85583465653557;  1 2 3]...
                       };
                       { 0.4 0.8 1.2;...
                      [-0.376334306292052	-0.376334306292052	-0.376334306292052; 1 2 3],	[-0.706666467343382	-0.706666467343382	-0.706666467343382; 1 2 3],	[-0.987239299670092	-0.987239299670092	-0.987239299670092; 1 2 3];...
                      [-0.227718654239836	-0.227718654239836  -0.227718654239836; 1 2 3], [-0.408017743026565	-0.408017743026565	-0.408017743026565; 1 2 3],	[-0.546412653239117	-0.546412653239117	-0.546412653239117; 1 2 3];...
                      [ 0                    0                   0;                 1 2 3],	[ 0                  0                   0;                 1 2 3], [ 0                  0                   0;                 1 2 3];...
                      [-0.13932150464649    -0.13932150464649	-0.13932150464649;  1 2 3],	[-0.249851730445413	-0.249851730445413	-0.249851730445413; 1 2 3],	[-0.336140688374095	-0.336140688374095	-0.336140688374095; 1 2 3]...
             } }...
         ) ...
     );
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    GRNstruct_with_multiple_NaN = struct( ...
         'rawExpressionData', struct(...
             't', struct ('indx', {[1 2 3]; [4 5 6]; [7 8 9]}, 't', {0.4; 0.8; 1.2}), ...
             'data', {[0.4	0.4	0.4	0.8	0.8	0.8	1.2	1.2	1.2;...
                      -0.376334306292052	-0.376334306292052	-0.376334306292052	-0.706666467343382	-0.706666467343382	-0.706666467343382	 NaN                -0.987239299670092	-0.987239299670092;...
                      -0.227718654239836	-0.227718654239836	 NaN                -0.408017743026565	-0.408017743026565	-0.408017743026565	-0.546412653239117	-0.546412653239117	-0.546412653239117;...
                       0.269293821322375	 0.269293821322375	 0.269293821322375	 0.415935372482249	 NaN            	 0.415935372482249 	 0.497511633589691	 0.497511633589691	 0.497511633589691;...
                      -0.290936155220703	-0.290936155220703	-0.290936155220703	-0.579771801563864	-0.579771801563864	-0.579771801563864	-0.85583465653557	-0.85583465653557	 NaN...
                      ];
                      [0.4	0.4	0.4	0.8	0.8	0.8	1.2	1.2	1.2;...
                      -0.376334306292052	-0.376334306292052	-0.376334306292052	-0.706666467343382	-0.706666467343382	 NaN                -0.987239299670092	-0.987239299670092	-0.987239299670092;...
                      -0.227718654239836	 NaN                -0.227718654239836	-0.408017743026565	-0.408017743026565	-0.408017743026565	-0.546412653239117	-0.546412653239117	-0.546412653239117;...
                       0                     0                   0                   0                   0                   0                   0                   0                   0;...
                       NaN                  -0.13932150464649	-0.13932150464649	 NaN                -0.249851730445413	-0.249851730445413	-0.336140688374095	-0.336140688374095	-0.336140688374095...
                      ]}...
         ) ...
     );

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

     expected_output_for_GRNstruct_with_multiple_NaN = struct (...
         'expressionData', struct (...
             'data', { { 0.4 0.8 1.2;...
                      [-0.376334306292052	-0.376334306292052	-0.376334306292052; 1 2 3],	[-0.706666467343382	-0.706666467343382	-0.706666467343382; 1 2 3],	[-0.987239299670092	-0.987239299670092;                       2 3];...
                      [-0.227718654239836	-0.227718654239836;                     1 2  ], [-0.408017743026565	-0.408017743026565	-0.408017743026565; 1 2 3],	[-0.546412653239117	-0.546412653239117	-0.546412653239117; 1 2 3];...
                      [0.269293821322375	 0.269293821322375	 0.269293821322375; 1 2 3],	[ 0.415935372482249	 0.415935372482249;                       1 3], [0.497511633589691	 0.497511633589691	 0.497511633589691; 1 2 3];...
                      [-0.290936155220703	-0.290936155220703	-0.290936155220703; 1 2 3],	[-0.579771801563864	-0.579771801563864	-0.579771801563864; 1 2 3],	[-0.85583465653557	-0.85583465653557;                        1 2]...
                       };
                       { 0.4 0.8 1.2;...
                      [-0.376334306292052	-0.376334306292052	-0.376334306292052; 1 2 3],	[-0.706666467343382	-0.706666467343382;                       1 2],	[-0.987239299670092	-0.987239299670092	-0.987239299670092; 1 2 3];...
                      [-0.227718654239836   -0.227718654239836;                       1 3], [-0.408017743026565	-0.408017743026565	-0.408017743026565; 1 2 3],	[-0.546412653239117	-0.546412653239117	-0.546412653239117; 1 2 3];...
                      [ 0                    0                   0;                 1 2 3],	[ 0                  0                   0;                 1 2 3], [ 0                  0                   0;                 1 2 3];...
                      [-0.13932150464649	-0.13932150464649;                        2 3],	[-0.249851730445413	-0.249851730445413;                       2 3],	[-0.336140688374095	-0.336140688374095	-0.336140688374095; 1 2 3]...
             } }...
         ) ...
     );
     
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    GRNstruct_with_inconsistent_timepoint = struct( ...
        'rawExpressionData', struct(...
             't', struct ('indx', {[1 2 3]; [4 5 6]; [7 8 9]}, 't', {0.4; 0.8; 1.2}), ...
             'data', {[0.4	0.4	0.4	0.4	0.8	0.8	1.2	1.2;...
                      -0.376334306292052	-0.376334306292052	-0.376334306292052	-0.706666467343382	-0.706666467343382	-0.706666467343382	-0.987239299670092	-0.987239299670092; ...
                      -0.227718654239836	-0.227718654239836	-0.227718654239836  -0.408017743026565	-0.408017743026565	-0.408017743026565	-0.546412653239117	-0.546412653239117; ...
                       0.269293821322375	 0.269293821322375	 0.269293821322375	 0.415935372482249	 0.415935372482249	 0.415935372482249 	 0.497511633589691	 0.497511633589691; ...
                      -0.290936155220703	-0.290936155220703	-0.290936155220703	-0.579771801563864	-0.579771801563864	-0.579771801563864	-0.85583465653557	-0.85583465653557 ...
                      ];
                      [0.4	0.4	0.4	0.4	0.8	0.8	1.2	1.2; ...
                      -0.376334306292052	-0.376334306292052	-0.376334306292052	-0.706666467343382	-0.706666467343382	-0.706666467343382	-0.987239299670092	-0.987239299670092; ...
                      -0.227718654239836	-0.227718654239836	-0.227718654239836	-0.408017743026565	-0.408017743026565	-0.408017743026565	-0.546412653239117	-0.546412653239117; ...
                       0                     0                   0                   0                   0                   0                   0                   0                ; ...
                      -0.13932150464649     -0.13932150464649	-0.13932150464649	-0.249851730445413	-0.249851730445413	-0.249851730445413	-0.336140688374095	-0.336140688374095 ...
             ]}...
         )...
    );
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    expected_output_for_GRNstruct_with_inconsistent_timepoint = struct (...
        'rawExpressionData', struct(...
                't', struct ('indx', {[1 2 3]; [4 5 6]; [7 8 9]}, 't', {0.4; 0.8; 1.2}), ...
                'data', {[0.4	0.4	0.4	0.4	0.8	0.8	1.2	1.2;...
                      -0.376334306292052	-0.376334306292052	-0.376334306292052	-0.706666467343382	-0.706666467343382	-0.706666467343382	-0.987239299670092	-0.987239299670092; ...
                      -0.227718654239836	-0.227718654239836	-0.227718654239836  -0.408017743026565	-0.408017743026565	-0.408017743026565	-0.546412653239117	-0.546412653239117; ...
                       0.269293821322375	 0.269293821322375	 0.269293821322375	 0.415935372482249	 0.415935372482249	 0.415935372482249 	 0.497511633589691	 0.497511633589691; ...
                      -0.290936155220703	-0.290936155220703	-0.290936155220703	-0.579771801563864	-0.579771801563864	-0.579771801563864	-0.85583465653557	-0.85583465653557 ...
                      ];
                      [0.4	0.4	0.4	0.4	0.8	0.8	1.2	1.2; ...
                      -0.376334306292052	-0.376334306292052	-0.376334306292052	-0.706666467343382	-0.706666467343382	-0.706666467343382	-0.987239299670092	-0.987239299670092; ...
                      -0.227718654239836	-0.227718654239836	-0.227718654239836	-0.408017743026565	-0.408017743026565	-0.408017743026565	-0.546412653239117	-0.546412653239117; ...
                       0                     0                   0                   0                   0                   0                   0                   0                ; ...
                      -0.13932150464649     -0.13932150464649	-0.13932150464649	-0.249851730445413	-0.249851730445413	-0.249851730445413	-0.336140688374095	-0.336140688374095 ...
                ]}...
            ),...
            'expressionData', struct (...
                'data', { { 0.4 0.8 1.2;...
                          [-0.376334306292052	-0.376334306292052	-0.376334306292052 -0.706666467343382; 1 2 3 4], [-0.706666467343382	-0.706666467343382; 1 2],	[-0.987239299670092	-0.987239299670092; 1 2];...
                          [-0.227718654239836	-0.227718654239836  -0.227718654239836 -0.408017743026565; 1 2 3 4], [-0.408017743026565	-0.408017743026565; 1 2],	[-0.546412653239117	-0.546412653239117; 1 2];...
                          [ 0.269293821322375	 0.269293821322375	 0.269293821322375  0.415935372482249; 1 2 3 4], [ 0.415935372482249	 0.415935372482249; 1 2],   [0.497511633589691	 0.497511633589691; 1 2];...
                          [-0.290936155220703	-0.290936155220703	-0.290936155220703 -0.579771801563864; 1 2 3 4], [-0.579771801563864	-0.579771801563864; 1 2],	[-0.85583465653557	-0.85583465653557;  1 2]...
                       };
                       { 0.4 0.8 1.2;...
                      [-0.376334306292052	-0.376334306292052	-0.376334306292052 -0.706666467343382; 1 2 3 4], [-0.706666467343382	-0.706666467343382; 1 2],	[-0.987239299670092	-0.987239299670092; 1 2];...
                      [-0.227718654239836	-0.227718654239836  -0.227718654239836 -0.408017743026565; 1 2 3 4], [-0.408017743026565	-0.408017743026565; 1 2],	[-0.546412653239117	-0.546412653239117; 1 2];...
                      [ 0                    0                   0                  0;                 1 2 3 4], [ 0                     0;                 1 2],   [ 0                  0;                 1 2];...
                      [-0.13932150464649    -0.13932150464649	-0.13932150464649  -0.249851730445413; 1 2 3 4], [-0.249851730445413	-0.249851730445413; 1 2],	[-0.336140688374095	-0.336140688374095; 1 2]...
                } }...
            ) ...
    );

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    % Should produce an error message to the user
    GRNstruct_with_too_much_missing_data = struct( ...
        'rawExpressionData', struct(...
             't', struct ('indx', {[1 2 3]; [4 5 6]; [7 8 9]}, 't', {0.4; 0.8; 1.2}), ...
             'data', {[0.4  0.4	0.4	0.8	0.8 0.8	1.2	1.2 1.2;...
                       NaN                   NaN                 NaN                -0.706666467343382	-0.706666467343382	-0.706666467343382	-0.987239299670092	-0.987239299670092  -0.987239299670092; ...
                      -0.227718654239836	-0.227718654239836	-0.227718654239836   NaN                 NaN                 NaN                -0.546412653239117	-0.546412653239117  -0.546412653239117; ...
                       0.269293821322375	 0.269293821322375	 0.269293821322375	 0.415935372482249	 0.415935372482249	 0.415935372482249 	 0.497511633589691	 0.497511633589691   0.497511633589691; ...
                      -0.290936155220703	-0.290936155220703	-0.290936155220703	-0.579771801563864	-0.579771801563864	-0.579771801563864	 NaN                NaN                  NaN...
                      ];
                      [0.4	0.4	0.4	0.8	0.8	0.8	1.2	1.2 1.2; ...
                      -0.376334306292052	-0.376334306292052	-0.376334306292052	-0.706666467343382	-0.706666467343382	-0.706666467343382	-0.987239299670092	-0.987239299670092 -0.987239299670092; ...
                      -0.227718654239836	-0.227718654239836	-0.227718654239836	-0.408017743026565	-0.408017743026565	-0.408017743026565	-0.546412653239117	-0.546412653239117 -0.546412653239117; ...
                       0                     0                   0                   0                   0                   0                   0                   0                  0; ...
                      -0.13932150464649     -0.13932150464649	-0.13932150464649	-0.249851730445413	-0.249851730445413	-0.249851730445413	-0.336140688374095	-0.336140688374095  0.336140688374095...
             ]}...
         )...
    );
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    end

end
