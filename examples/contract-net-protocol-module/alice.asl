// starts 3 different CNPs
!start([fix(tv),fix(pc),fix(oven)]).

+!start([]).
+!start([fix(T)|R])
    <-  .include("initiator.asl",T); // loads initiator.asl into namespace T (the product)
        .add_plan(
            {+T::winner(W) <-        // the +winner event is produced by the initiator module
                .print("Winner to fix ",T," is ",W)
            });
        // sub-goal with new focus, the plan for startCNP is defined in the initiator module
        !!T::startCNP(fix(T));
        !start(R).
