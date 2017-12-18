<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:genericpage>
    <jsp:attribute name="pagetitle">
        Dispute
    </jsp:attribute>
    <jsp:attribute name="pagecss">
    </jsp:attribute>

    <jsp:attribute name="pagejavascript">
        <script src="${pageContext.request.contextPath}/js/test.js"></script>
    </jsp:attribute>

    <jsp:body>
        <div class="container" style="margin-top: 75px">
            <button>Dispute in Corso</button>
            <button>Dispute Completate</button>
        </div>
        <div class="bs-example" style="margin: 20px;">
            <div class="panel-group" id="accordion">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">Disputa</a>
                        </h4>
                    </div>
                    <div id="collapseOne" class="panel-collapse collapse">
                        <div class="panel-body">
                            <p>HTML stands for HyperText Markup Language. HTML is the main markup language for describing the structure of Web pages. <a href="https://www.tutorialrepublic.com/html-tutorial/" target="_blank">Learn more.</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </jsp:body>

</t:genericpage>

