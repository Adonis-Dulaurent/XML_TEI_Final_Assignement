<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" version="2.0">

    <xsl:output method="html" indent="yes" encoding="UTF-8"/>

    <!--Variable de noms des fichiers de sortie -->
    <xsl:variable name="home">
        <xsl:value-of select="concat('home', '.', 'html')"/>
    </xsl:variable>

    <xsl:variable name="transciption">
        <xsl:value-of select="concat('transcription', '.', 'html')"/>
    </xsl:variable>

    <xsl:variable name="facsimile">
        <xsl:value-of select="concat('facsimile', '.', 'html')"/>
    </xsl:variable>

    <xsl:variable name="index">
        <xsl:value-of select="concat('index', '.', 'html')"/>
    </xsl:variable>

    <!-- Variable contenant le Header HTML -->
    <xsl:variable name="head">
        <head>
            <meta name="viewport" content="width=device-width, initial-scale=1"/>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"/>
            <link rel="stylesheet" href="style.css"/>
            <xsl:value-of select="//titleStmt/title"/>
            <meta name="author">
                <xsl:attribute name="content">
                    <xsl:value-of select="//respStmt/persName"/>
                </xsl:attribute>
            </meta>
            <meta name="description" content="Édition numérique des comptes-rendus du secrétariat du Parti communiste Français"/>
            <meta name="keywords" content="XSLT, XML, TEI, PCF"/>
        </head>
    </xsl:variable>
    
    <!-- Création de la variable pour la barre de navigation -->
    <xsl:variable name="navbar">
        <header>
            <nav class="navbar navbar-expend-md navbar-light bg-light">
                <a class="navbar-brand" href="{$home}">Acceuil</a>
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="{$transcription}">transcription</a>
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
        
        <!--boutton de retour en haut de la page -->
        <button type="button" class="btn" id="bouton_retour"><img src="../img/caret-up-fill.svg" alt="Flèche" width="15" height="25"/></button>
    </xsl:variable>

    <!--Variable contenant le Footer -->
    <xsl:variable name="footer">
        <footer class ="bg-light text-muted">
            <div class="container">
            <p class="p-3 mb-0">
                <xsl:value-of select="//respStmt/persName"/>© <xsl:value-of select="//respStmt/persName"/>
            </p>
            </div>
        </footer>
        <script src="script.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </xsl:variable>
    
    <!--Match de la racine du doc TEI avec les templates -->
    <xsl:template match="/">
        <xsl:call-template name="home"/>
        <xsl:call-template name="transcription"/>
        <xsl:call-template name="facsimile"/>
        <xsl:call-template name="index"/>
    </xsl:template>
    
    <!-- Template pour home -->
    <xsl:template name="home">
        <xsl:result-document href="{$home}" method="html" indent="yes">
            <html>
                
            </html>
    </xsl:template>
</xsl:stylesheet>
