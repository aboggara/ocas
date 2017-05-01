%%%-------------------------------------------------------------------
%%% Copyright (c) 2017, sFractal Consulting, LLC

%%% Licensed under the Apache License, Version 2.0 (the "License");
%%% you may not use this file except in compliance with the License.
%%% You may obtain a copy of the License at

%%%     http://www.apache.org/licenses/LICENSE-2.0

%%% Unless required by applicable law or agreed to in writing, software
%%% distributed under the License is distributed on an "AS IS" BASIS,
%%% WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
%%% See the License for the specific language governing permissions and
%%% limitations under the License.

%%%-------------------------------------------------------------------

%%%-------------------------------------------------------------------
%% @doc test a series of openc2 json commands
%% @end
%%%-------------------------------------------------------------------

-module(json_SUITE).
-author("Duncan Sparrell").
-copyright("2017, sFractal Consulting, LLC").
-license(apache2).

%% for test export all functions
-compile(export_all).

%% required for common_test to work
-include_lib("common_test/include/ct.hrl").

%% tests to run
all() ->
    [ test_allow
    , test_allow_again
    , test_augment
    , test_augment_again
    , test_cancel
    , test_cancel_again
    , test_contain
    , test_contain_again
    , test_copy
    , test_copy_again
    , test_delay
    , test_delay_again
    , test_delete
    , test_delete_again
    , test_demense
    , test_demense_again
    , test_deny
    , test_deny_again
    , test_detonate
    , test_detonate_again
    , test_distill
    , test_distill_again
    , test_get
    , test_get_again
    , test_investigate
    , test_investigate_again
    , test_locate
    , test_locate_again
    , test_mitigate
    , test_mitigate_again
    , test_modify
    , test_modify_again
    , test_move
    , test_move_again
    , test_notify
    , test_notify_again
    , test_pause
    , test_pause_again
    , test_query
    , test_query_again
    , test_remediate
    , test_remediate_again
    , test_redirect
    , test_redirect_again
    , test_report
    , test_report_again
    , test_restart
    , test_restart_again
    , test_restore
    , test_restore_again
    , test_resume
    , test_resume_again
    , test_save
    , test_save_again
    , test_scan
    , test_scan_again
    , test_set
    , test_set_again
    , test_snapshot
    , test_snapshot_again
    , test_start
    , test_start_again
    , test_stop
    , test_stop_again
    , test_substitute
    , test_substitute_again
    , test_sync
    , test_sync_again
    , test_throttle
    , test_throttle_again
    , test_update
    , test_update_again
    ].

%% timeout if no reply in a minute
suite() ->
    [{timetrap, {minutes, 2}}].

%% setup config parameters
init_per_suite(Config) ->
    {ok, _AppList} = application:ensure_all_started(lager),

    {ok, _AppList2} = application:ensure_all_started(shotgun),

    %% since ct doesn't read sys.config, set configs here
    application:set_env(ocas, port, 8080),
    application:set_env(ocas, listener_count, 5),

    %% set up logging
    application:set_env(lager
                       , handlers
                       , [ {lager_console_backend, debug}
                         , {lager_common_test_backend, debug}
                         ]
                       ),
    lager:set_loglevel(lager_console_backend, debug),

    %% start application
    {ok, _AppList3} = application:ensure_all_started(ocas),

    Config.

end_per_suite(Config) ->
    Config.

test_allow(Config) ->

    %% send allow01.json and get allow01.results.json
    helper_json:post_oc2( "allow01.json"
                        , "allow01.results.json"
                        , Config
                        ),
    ok.

test_allow_again(Config) ->
    %% run again to exercise different legs of code when servers already running
    helper_json:post_oc2( "allow01.json"
                        , "allow01.results.json"
                        , Config
                        ),


    ok.

test_augment(Config) ->
    %% send command and compare expected results
    helper_json:post_oc2( "augment01.json"
                        , "augment01.results.json"
                        , Config
                        ),
    ok.

test_augment_again(Config) ->
    %% run again to exercise different legs of code when servers already running
    %% send command and compare expected results
    helper_json:post_oc2( "augment01.json"
                        , "augment01.results.json"
                        , Config
                        ),
    ok.

test_cancel(Config) ->
    %% send command and compare expected results
    helper_json:post_oc2( "cancel01.json"
                        , "cancel01.results.json"
                        , Config
                        ),
    ok.

test_cancel_again(Config) ->
    %% run again to exercise different legs of code when servers already running
    %% send command and compare expected results
    helper_json:post_oc2( "cancel01.json"
                        , "cancel01.results.json"
                        , Config
                        ),
    ok.

test_contain(Config) ->
    %% send command and compare expected results
    helper_json:post_oc2( "contain01.json"
                        , "contain01.results.json"
                        , Config
                        ),
    ok.

test_contain_again(Config) ->
    %% run again to exercise different legs of code when servers already running
    %% send command and compare expected results
    helper_json:post_oc2( "contain01.json"
                        , "contain01.results.json"
                        , Config
                        ),
    ok.

test_copy(Config) ->
    %% send command and compare expected results
    helper_json:post_oc2( "copy01.json"
                        , "copy01.results.json"
                        , Config
                        ),
    ok.

test_copy_again(Config) ->
    %% run again to exercise different legs of code when servers already running
    %% send command and compare expected results
    helper_json:post_oc2( "copy01.json"
                        , "copy01.results.json"
                        , Config
                        ),
    ok.

test_delay(Config) ->
    %% send command and compare expected results
    helper_json:post_oc2( "delay01.json"
                        , "delay01.results.json"
                        , Config
                        ),
    ok.

test_delay_again(Config) ->
    %% run again to exercise different legs of code when servers already running
    %% send command and compare expected results
    helper_json:post_oc2( "delay01.json"
                        , "delay01.results.json"
                        , Config
                        ),
    ok.

test_delete(Config) ->
    %% send command and compare expected results
    helper_json:post_oc2( "delete01.json"
                        , "delete01.results.json"
                        , Config
                        ),
    ok.

test_delete_again(Config) ->
    %% run again to exercise different legs of code when servers already running
    %% send command and compare expected results
    helper_json:post_oc2( "delete01.json"
                        , "delete01.results.json"
                        , Config
                        ),
    ok.

test_demense(Config) ->

    %% send command and compare expected results
    helper_json:post_oc2( "mitigate01.json"
                        , "mitigate01.results.json"
                        , Config
                        ),
    ok.

test_demense_again(Config) ->
    %% run again to exercise different legs of code when servers already running

    %% send command and compare expected results
    helper_json:post_oc2( "mitigate01.json"
                        , "mitigate01.results.json"
                        , Config
                        ),
    ok.

test_deny(Config) ->
    %% send command and compare expected results
    helper_json:post_oc2( "deny01.json"
                        , "deny01.results.json"
                        , Config
                        ),
    ok.

test_deny_again(Config) ->
    %% run again to exercise different legs of code when servers already running
    %% send command and compare expected results
    helper_json:post_oc2( "deny01.json"
                        , "deny01.results.json"
                        , Config
                        ),
    ok.

test_detonate(Config) ->
    %% send command and compare expected results
    helper_json:post_oc2( "detonate01.json"
                        , "detonate01.results.json"
                        , Config
                        ),
    ok.

test_detonate_again(Config) ->
    %% run again to exercise different legs of code when servers already running
    %% send command and compare expected results
    helper_json:post_oc2( "detonate01.json"
                        , "detonate01.results.json"
                        , Config
                        ),
    ok.

test_distill(Config) ->
    %% send command and compare expected results
    helper_json:post_oc2( "distill01.json"
                        , "distill01.results.json"
                        , Config
                        ),
    ok.

test_distill_again(Config) ->
    %% run again to exercise different legs of code when servers already running
    %% send command and compare expected results
    helper_json:post_oc2( "distill01.json"
                        , "distill01.results.json"
                        , Config
                        ),
    ok.

test_get(Config) ->
    %% send command and compare expected results
    helper_json:post_oc2( "get01.json"
                        , "get01.results.json"
                        , Config
                        ),
    ok.

test_get_again(Config) ->
    %% run again to exercise different legs of code when servers already running
    %% send command and compare expected results
    helper_json:post_oc2( "get01.json"
                        , "get01.results.json"
                        , Config
                        ),
    ok.

test_investigate(Config) ->
    %% send command and compare expected results
    helper_json:post_oc2( "investigate01.json"
                        , "investigate01.results.json"
                        , Config
                        ),
    ok.

test_investigate_again(Config) ->
    %% run again to exercise different legs of code when servers already running
    %% send command and compare expected results
    helper_json:post_oc2( "investigate01.json"
                        , "investigate01.results.json"
                        , Config
                        ),
    ok.

test_locate(Config) ->
    %% send command and compare expected results
    helper_json:post_oc2( "locate01.json"
                        , "locate01.results.json"
                        , Config
                        ),
    ok.

test_locate_again(Config) ->
    %% run again to exercise different legs of code when servers already running
    %% send command and compare expected results
    helper_json:post_oc2( "locate01.json"
                        , "locate01.results.json"
                        , Config
                        ),
    ok.

test_mitigate(Config) ->
    %% send command and compare expected results
    helper_json:post_oc2( "mitigate01.json"
                        , "mitigate01.results.json"
                        , Config
                        ),
    ok.

test_mitigate_again(Config) ->
    %% run again to exercise different legs of code when servers already running

    %% send command and compare expected results
    helper_json:post_oc2( "mitigate01.json"
                        , "mitigate01.results.json"
                        , Config
                        ),
    ok.

test_modify(Config) ->
    %% send command and compare expected results
    helper_json:post_oc2( "modify01.json"
                        , "modify01.results.json"
                        , Config
                        ),
    ok.

test_modify_again(Config) ->
    %% run again to exercise different legs of code when servers already running
    %% send command and compare expected results
    helper_json:post_oc2( "modify01.json"
                        , "modify01.results.json"
                        , Config
                        ),
    ok.

test_move(Config) ->
    %% send command and compare expected results
    helper_json:post_oc2( "move01.json"
                        , "move01.results.json"
                        , Config
                        ),
    ok.

test_move_again(Config) ->
    %% run again to exercise different legs of code when servers already running
    %% send command and compare expected results
    helper_json:post_oc2( "move01.json"
                        , "move01.results.json"
                        , Config
                        ),
    ok.

test_notify(Config) ->
    %% send command and compare expected results
    helper_json:post_oc2( "notify01.json"
                        , "notify01.results.json"
                        , Config
                        ),
    ok.

test_notify_again(Config) ->
    %% run again to exercise different legs of code when servers already running
    %% send command and compare expected results
    helper_json:post_oc2( "notify01.json"
                        , "notify01.results.json"
                        , Config
                        ),
    ok.

test_pause(Config) ->
    %% send command and compare expected results
    helper_json:post_oc2( "pause01.json"
                        , "pause01.results.json"
                        , Config
                        ),
    ok.

test_pause_again(Config) ->
    %% run again to exercise different legs of code when servers already running
    %% send command and compare expected results
    helper_json:post_oc2( "pause01.json"
                        , "pause01.results.json"
                        , Config
                        ),
    ok.

test_query(Config) ->
    %% send command and compare expected results
    helper_json:post_oc2( "query01.json"
                        , "query01.results.json"
                        , Config
                        ),
    ok.

test_query_again(Config) ->
    %% run again to exercise different legs of code when servers already running
    %% send command and compare expected results
    helper_json:post_oc2( "query01.json"
                        , "query01.results.json"
                        , Config
                        ),
    ok.


test_remediate(Config) ->
    %% send command and compare expected results
    helper_json:post_oc2( "remediate01.json"
                        , "remediate01.results.json"
                        , Config
                        ),
    ok.

test_remediate_again(Config) ->
    %% run again to exercise different legs of code when servers already running
    %% send command and compare expected results
    helper_json:post_oc2( "remediate01.json"
                        , "remediate01.results.json"
                        , Config
                        ),
    ok.

test_redirect(Config) ->
    %% send command and compare expected results
    helper_json:post_oc2( "redirect01.json"
                        , "redirect01.results.json"
                        , Config
                        ),
    ok.

test_redirect_again(Config) ->
    %% run again to exercise different legs of code when servers already running
    %% send command and compare expected results
    helper_json:post_oc2( "redirect01.json"
                        , "redirect01.results.json"
                        , Config
                        ),
    ok.

test_report(Config) ->
    %% send command and compare expected results
    helper_json:post_oc2( "report01.json"
                        , "report01.results.json"
                        , Config
                        ),
    ok.

test_report_again(Config) ->
    %% run again to exercise different legs of code when servers already running
    %% send command and compare expected results
    helper_json:post_oc2( "report01.json"
                        , "report01.results.json"
                        , Config
                        ),
    ok.

test_restart(Config) ->
    %% send command and compare expected results
    helper_json:post_oc2( "restart01.json"
                        , "restart01.results.json"
                        , Config
                        ),
    ok.

test_restart_again(Config) ->
    %% run again to exercise different legs of code when servers already running
    %% send command and compare expected results
    helper_json:post_oc2( "restart01.json"
                        , "restart01.results.json"
                        , Config
                        ),
    ok.

test_restore(Config) ->
    %% send command and compare expected results
    helper_json:post_oc2( "restore01.json"
                        , "restore01.results.json"
                        , Config
                        ),
    ok.

test_restore_again(Config) ->
    %% run again to exercise different legs of code when servers already running
    %% send command and compare expected results
    helper_json:post_oc2( "restore01.json"
                        , "restore01.results.json"
                        , Config
                        ),
    ok.

test_resume(Config) ->
    %% send command and compare expected results
    helper_json:post_oc2( "resume01.json"
                        , "resume01.results.json"
                        , Config
                        ),
    ok.

test_resume_again(Config) ->
    %% run again to exercise different legs of code when servers already running
    %% send command and compare expected results
    helper_json:post_oc2( "resume01.json"
                        , "resume01.results.json"
                        , Config
                        ),
    ok.

test_save(Config) ->
    %% send command and compare expected results
    helper_json:post_oc2( "save01.json"
                        , "save01.results.json"
                        , Config
                        ),
    ok.

test_save_again(Config) ->
    %% run again to exercise different legs of code when servers already running
    %% send command and compare expected results
    helper_json:post_oc2( "save01.json"
                        , "save01.results.json"
                        , Config
                        ),
    ok.

test_scan(Config) ->
    %% send command and compare expected results
    helper_json:post_oc2( "scan01.json"
                        , "scan01.results.json"
                        , Config
                        ),
    ok.

test_scan_again(Config) ->
    %% run again to exercise different legs of code when servers already running
    %% send command and compare expected results
    helper_json:post_oc2( "scan01.json"
                        , "scan01.results.json"
                        , Config
                        ),
    ok.

test_set(Config) ->
    %% send command and compare expected results
    helper_json:post_oc2( "set01.json"
                        , "set01.results.json"
                        , Config
                        ),
    ok.

test_set_again(Config) ->
    %% run again to exercise different legs of code when servers already running
    %% send command and compare expected results
    helper_json:post_oc2( "set01.json"
                        , "set01.results.json"
                        , Config
                        ),
    ok.

test_snapshot(Config) ->
    %% send command and compare expected results
    helper_json:post_oc2( "snapshot01.json"
                        , "snapshot01.results.json"
                        , Config
                        ),
    ok.

test_snapshot_again(Config) ->
    %% run again to exercise different legs of code when servers already running
    %% send command and compare expected results
    helper_json:post_oc2( "snapshot01.json"
                        , "snapshot01.results.json"
                        , Config
                        ),
    ok.

test_start(Config) ->
    %% send command and compare expected results
    helper_json:post_oc2( "start01.json"
                        , "start01.results.json"
                        , Config
                        ),
    ok.

test_start_again(Config) ->
    %% run again to exercise different legs of code when servers already running
    %% send command and compare expected results
    helper_json:post_oc2( "start01.json"
                        , "start01.results.json"
                        , Config
                        ),
    ok.

test_stop(Config) ->
    %% send command and compare expected results
    helper_json:post_oc2( "stop01.json"
                        , "stop01.results.json"
                        , Config
                        ),
    ok.

test_stop_again(Config) ->
    %% run again to exercise different legs of code when servers already running
    %% send command and compare expected results
    helper_json:post_oc2( "stop01.json"
                        , "stop01.results.json"
                        , Config
                        ),
    ok.

test_substitute(Config) ->
    %% send command and compare expected results
    helper_json:post_oc2( "substitute01.json"
                        , "substitute01.results.json"
                        , Config
                        ),
    ok.

test_substitute_again(Config) ->
    %% run again to exercise different legs of code when servers already running
    %% send command and compare expected results
    helper_json:post_oc2( "substitute01.json"
                        , "substitute01.results.json"
                        , Config
                        ),
    ok.

test_sync(Config) ->
    %% send command and compare expected results
    helper_json:post_oc2( "sync01.json"
                        , "sync01.results.json"
                        , Config
                        ),
    ok.

test_sync_again(Config) ->
    %% run again to exercise different legs of code when servers already running
    %% send command and compare expected results
    helper_json:post_oc2( "sync01.json"
                        , "sync01.results.json"
                        , Config
                        ),
    ok.

test_throttle(Config) ->
    %% send command and compare expected results
    helper_json:post_oc2( "throttle01.json"
                        , "throttle01.results.json"
                        , Config
                        ),
    ok.

test_throttle_again(Config) ->
    %% run again to exercise different legs of code when servers already running
    %% send command and compare expected results
    helper_json:post_oc2( "throttle01.json"
                        , "throttle01.results.json"
                        , Config
                        ),
    ok.

test_update(Config) ->
    %% send command and compare expected results
    helper_json:post_oc2( "update01.json"
                        , "update01.results.json"
                        , Config
                        ),
    ok.

test_update_again(Config) ->
    %% run again to exercise different legs of code when servers already running
    %% send command and compare expected results
    helper_json:post_oc2( "update01.json"
                        , "update01.results.json"
                        , Config
                        ),
    ok.

