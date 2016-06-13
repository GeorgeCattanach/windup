
<!DOCTYPE html>


<#assign applicationReportIndexModel = reportModel.applicationReportIndexModel>

<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>${reportModel.projectModel.name} - JBPM Report</title>
    <link href="resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="resources/css/windup.css" rel="stylesheet" media="screen">
    <link href="resources/img/favicon.png" rel="shortcut icon" type="image/x-icon"/>
</head>
<body role="document">

    <!-- Navbar -->
    <div id="main-navbar" class="navbar navbar-default navbar-fixed-top">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-responsive-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
        </div>
        <div class="navbar-collapse collapse navbar-responsive-collapse">
            <#include "include/navbar.ftl">
        </div>
    </div>
    <!-- / Navbar -->

    <div class="container-fluid" role="main">
        <div class="row">
            <div class="page-header page-header-no-border">
                <h1>
                    <div class="main">JBPM Process Report</div>
                    <div class="path">${reportModel.projectModel.name?html}</div>
                </h1>
                <div class="desc">
                    The JBPM process report shows the basic characteristics of JBPM processes found in the application,
                    such like count of nodes, states, tasks, decisions, subprocesses, etc.
                    Also lists the action handlers and decision handlers.
                </div>
            </div>
        </div>

        <#if iterableHasContent(reportModel.relatedResources.processes)>
            <#list reportModel.relatedResources.processes.list.iterator() as process>

            <div class="row">
                <div class="container-fluid theme-showcase" role="main">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title">Process:
                                <#if process.processName??>${process.processName}<#else>${process.fileName}</#if>
                            </h3>
                        </div>
                            <div class="panel-body">
                                <dl class="dl-horizontal small">
                                    <dt>Process</dt>
                                    <dd><@render_link model=process project=reportModel.projectModel/></dd>

                                    <#if process.processName??>
                                        <dt>Name</dt>
                                        <dd>${process.processName}</dd>
                                    </#if>

                                    <#if process.nodeCount &gt; 0>
                                        <dt>Nodes</dt>
                                        <dd>${process.nodeCount}</dd>
                                    </#if>

                                    <#if process.decisionCount &gt; 0>
                                        <dt>Decisions</dt>
                                        <dd>${process.decisionCount}</dd>
                                    </#if>

                                    <#if process.stateCount &gt; 0>
                                        <dt>States</dt>
                                        <dd>${process.stateCount}</dd>
                                    </#if>

                                    <#if process.taskCount &gt; 0>
                                        <dt>Tasks</dt>
                                        <dd>${process.taskCount}</dd>
                                    </#if>

                                    <#if process.subProcessCount &gt; 0>
                                        <dt>Sub-Processes</dt>
                                        <dd>${process.subProcessCount}</dd>
                                    </#if>
                                </dl>
                                <#if process.processImage??>
                                <div class="thumbnail">
                                <img src="${getPrettyPathForFile(process.processImage)}"/>
                                </div>
                                </#if>

                                <#list process.actionHandlers.iterator()>
                                    <table class="table table-striped table-bordered">
                                        <tr>
                                          <th>Action Handler</th>
                                        </tr>
                                        <#items as actionHandler>
                                            <tr>
                                                <td><@render_link model=actionHandler project=reportModel.projectModel/></td>
                                            </tr>
                                        </#items>
                                    </table>
                                </#list>

                                <#list process.decisionHandlers.iterator()>
                                    <table class="table table-striped table-bordered">
                                        <tr>
                                          <th>Decision Handler</th>
                                        </tr>
                                        <#items as decisionHandler>
                                            <tr>
                                                <td><@render_link model=decisionHandler project=reportModel.projectModel/></td>
                                            </tr>
                                        </#items>
                                    </table>
                                </#list>


                            </div>
                    </div><!--end of panel-->
                </div> <!-- /container -->
            </div><!-- /row -->
            </#list>
        </#if>
    </div><!-- /container main -->
    <script src="resources/js/jquery-1.10.1.min.js"></script>
    <script src="resources/js/bootstrap.min.js"></script>
</body>
</html>