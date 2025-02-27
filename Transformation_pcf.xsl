<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" version="2.0">

    <xsl:output method="html" indent="yes" encoding="UTF-8"/>

    <!--Output file name variable -->
    <xsl:variable name="home">
        <xsl:value-of select="concat('home', '.', 'html')"/>
    </xsl:variable>

    <xsl:variable name="transcription">
        <xsl:value-of select="concat('transcription', '.', 'html')"/>
    </xsl:variable>

    <xsl:variable name="facsimile">
        <xsl:value-of select="concat('facsimile', '.', 'html')"/>
    </xsl:variable>

    <xsl:variable name="index">
        <xsl:value-of select="concat('index', '.', 'html')"/>
    </xsl:variable>

    <!-- Variable containing the HTML Header -->
    <xsl:variable name="head">
        <head>
            <meta name="viewport" content="width=device-width, initial-scale=1"/>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
                rel="stylesheet"
                integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
                crossorigin="anonymous"/>
            <link rel="stylesheet" href="style.css"/>
            <xsl:value-of select="//titleStmt/title"/>
            <meta name="author">
                <xsl:attribute name="content">
                    <xsl:value-of select="//respStmt/persName"/>
                </xsl:attribute>
            </meta>
            <meta name="description"
                content="Édition numérique des comptes-rendus du secrétariat du Parti communiste Français"/>
            <meta name="keywords" content="XSLT, XML, TEI, PCF"/>
        </head>
    </xsl:variable>

    <!--  variable for navigation bar -->
    <xsl:variable name="navbar">
        <header>
            <nav class="navbar navbar-expend-md navbar-light bg-light">
                <a class="navbar-brand" href="{$home}">Home</a>
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="{$transcription}">Transcription</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="{$facsimile}">Facsimile</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="{$index}">Index</a>
                    </li>
                </ul>
            </nav>
        </header>

        <!--back to top of page -->
        <button type="button" class="btn" id="bouton_retour">
            <img src="../pictures/caret-up-fill.svg" alt="Flèche" width="15" height="25"/>
        </button>
    </xsl:variable>

    <!--Variable for  Footer -->
    <xsl:variable name="footer">
        <footer class="bg-light text-muted">
            <div class="container">
                <p class="p-3 mb-0"> © <xsl:value-of select="//respStmt/persName"/>
                </p>
            </div>
        </footer>
        <script src="script.js"/>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"/>
    </xsl:variable>

    <!--Matching TEI doc root with templates -->
    <xsl:template match="/">
        <xsl:call-template name="home"/>
        <!--<xsl:call-template name="transcription"/>
        <xsl:call-template name="facsimile"/>
        <xsl:call-template name="index"/>-->
    </xsl:template>

    <!-- Template for Home -->
    <xsl:template name="home">
        <xsl:result-document href="{$home}" method="html" indent="yes">
            <html>
                <xsl:copy-of select="$head"/>
                <body>
                    <xsl:copy-of select="$navbar"/>
                    <main>
                        <!-- banner -->
                        <div class="row">
                            <div class="col-md-12" id="banner">
                                <!-- Principal Title  -->
                                <h1 class="text_light" id="Title">
                                    <xsl:value-of select="//titleStmt/title"/>
                                </h1>
                                <!-- Text on the banner-->
                                <div class="banner_text">
                                    <xsl:value-of select="//respStmt/resp"/> by <xsl:value-of
                                        select="//respStmt/persName"/>
                                </div>
                            </div>
                        </div>
                        <!-- About -->
                        <div class="about">
                            <p>This project constitutes an encoding proposal for the digitized
                                meeting minutes of the French Communist Party’s Secretariat,
                                preserved at the Departmental Archives of Seine-Saint-Denis
                                (France). Developed as part of the XSLT coursework within the
                                Master’s program in Digital Technologies Applied to History (TNAH)
                                at the École Nationale des Chartes, this initiative aims to
                                structure and enhance historical records through standardized markup
                                practices.The digitized minutes, accessible via the <a
                                    href="https://archives.seinesaintdenis.fr/ark:/79690/vta46b59c4cbb3b01d2"
                                    > archives’ online platform </a> , serve as the primary source
                                material for this encoding effort, which seeks to improve both
                                analytical capabilities and long-term preservation of these
                                documents.</p>
                        </div>
                    </main>
                    <xsl:copy-of select="$footer"/>> </body>
            </html>
        </xsl:result-document>
    </xsl:template>
</xsl:stylesheet>
