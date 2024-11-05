
:- dynamic task/4.
add_task(ID, Descrip, Assignee, Stat) :-
    \+ task(ID, _, _, _),
    assert(task(ID, Descrip, Assignee, Stat)).


assign_tasks(ID, Assignee) :-
    task(ID, Description, _, Stat),
    retract(task(ID, Description, _, Stat)),
    assertz(task(ID, Description, Assignee, Stat)).

mark_completed(ID) :-
    retract(task(ID, Description, Assignee, false)),
    assertz(task(ID, Description, Assignee, true)).

display_all_tasks :-
    forall(task(ID, Description, Assignee, Status),
           format('Task ID: ~w~nDescription: ~w~nAssignee: ~w~nStatus: ~w~n~n',
                  [ID, Description, Assignee, Status])).
display_tasks_assigned_to(User) :-
    forall(
        task(TaskID, Description, User, Completed),
        format('Task ~w:~n - Description: ~w~n - Completion status: ~w~n~n',
               [TaskID, Description, Completed])
    ).
display_completed_tasks :-
    forall(
        task(TaskID, Description, Assignee, true),
        format('Task ~w:~n - Description: ~w~n - Assignee: ~w~n~n',
               [TaskID, Description, Assignee])
    ).










