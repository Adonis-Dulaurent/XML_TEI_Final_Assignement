<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" version="2.0">


    <!-- Configuration globale de la transformation -->
    <xsl:output method="html" indent="yes" encoding="UTF-8"/>

    <!-- 
    Variables pour les noms de fichiers de sortie
    Permet de centraliser et facilement modifier les noms de fichiers générés 
    -->
    <xsl:variable name="home">
        <xsl:value-of select="concat('home', '.', 'html')"/>
    </xsl:variable>

    <xsl:variable name="transcription">
        <xsl:value-of select="concat('transcription', '.', 'html')"/>
    </xsl:variable>

    <xsl:variable name="facsimile">
        <xsl:value-of select="concat('facsimile', '.', 'html')"/>
    </xsl:variable>

    <xsl:variable name="index_name">
        <xsl:value-of select="concat('index_name', '.', 'html')"/>
    </xsl:variable>

    <xsl:variable name="index_lieux">
        <xsl:value-of select="concat('index_lieux', '.', 'html')"/>
    </xsl:variable>

    <xsl:variable name="index_organisme">
        <xsl:value-of select="concat('index_organisme', '.', 'html')"/>
    </xsl:variable>

    <!-- VARIABLES DE STRUCTURE HTML 
    Extraction centralisée des éléments communs à toutes les pages -->
    <!-- Variable contenant l'en-tête HTML générique -->
    <xsl:variable name="head">
        <head>
            <!-- Métadonnées et configuration responsive -->
            <meta name="viewport" content="width=device-width, initial-scale=1"/>
            <!-- Intégration des bibliothèques CSS et JS -->
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
                rel="stylesheet"
                integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
                crossorigin="anonymous"/>
            <link rel="stylesheet" href="style.css"/>
            <!-- Métadonnées dynamiques extraites du document source -->
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
                        <a class="nav-link" href="{$index_name}">Index des noms</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="{$index_lieux}">Index des lieux</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="{$index_organisme}">Index des Organismes</a>
                    </li>
                </ul>
            </nav>
        </header>
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

    <!-- 
    Template principal
    Génère l'ensemble des pages HTML à partir du document source 
    -->
    
    <xsl:template match="/">
        <xsl:call-template name="home"/>
        <xsl:call-template name="transcription"/>
        <xsl:call-template name="facsimile"/>
        <xsl:call-template name="index_name"/>
        <xsl:call-template name="index_lieux"/>
        <xsl:call-template name="index_organisme"/>
    </xsl:template>

    <!-- Template pour Home -->
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
                                <!-- Titre principal  -->
                                <h1 class="text_light" id="Title">
                                    <xsl:value-of select="//titleStmt/title"/>
                                </h1>
                                <!-- Texte de la banière-->
                                <div class="banner_text">
                                    <xsl:value-of select="//respStmt/resp"/> by <xsl:value-of
                                        select="//respStmt/persName"/>
                                </div>
                            </div>
                        </div>
                        <!-- A propos -->
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
                    <xsl:copy-of select="$footer"/>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>

    <!-- Template pour la Transcription -->
    <xsl:template name="transcription">
        <xsl:result-document href="{$transcription}" method="html" indent="yes">
            <html>
                <xsl:copy-of select="$head"/>
                <body>
                    <xsl:copy-of select="$navbar"/>
                    <main class="container-fluid">
                        <div class="container-fluid">
                            <div class="row mt-3">
                                <!-- Itération sur chaque div1 -->
                                <xsl:for-each select="//body/div1">
                                    <div class="col-md-4">
                                        <!-- Utilisation de col-md-4 pour 3 colonnes côte à côte -->
                                        <section class="text-section">
                                            <!-- Titre principal (h2) extrait du <head> du div1 courant -->
                                            <h2>
                                                <xsl:value-of select="head"/>
                                            </h2>

                                            <!-- Itération sur chaque div2 dans le div1 courant -->
                                            <xsl:for-each select="div2/div3">
                                                <div class="sub-section">
                                                  <!-- Titre secondaire (h3) extrait du <head> du div2 courant -->
                                                  <h3>
                                                  <xsl:value-of select="head"/>
                                                  </h3>

                                                  <!-- Contenu du div2 SANS le head -->
                                                  <div class="content">
                                                  <xsl:apply-templates select="node() except head"/>
                                                  </div>
                                                </div>
                                            </xsl:for-each>
                                        </section>
                                    </div>
                                </xsl:for-each>
                            </div>
                        </div>
                    </main>
                    <xsl:copy-of select="$footer"/>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>

    <!-- Templates pour le contenu des div1 et div2 -->
    <xsl:template match="p">
        <!-- Traitement des paragraphes -->
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>

    <xsl:template match="list">
        <!-- Traitement des listes -->
        <ul>
            <xsl:for-each select="item">
                <li>
                    <xsl:apply-templates/>
                </li>
            </xsl:for-each>
        </ul>
    </xsl:template>

    <!-- Création d'un fac-similé -->
    <xsl:template name="facsimile">
        <xsl:result-document href="{$facsimile}" method="html" indent="yes">
            <html>
                <xsl:copy-of select="$head"/>
                <body>
                    <xsl:copy-of select="$navbar"/>
                    <main class="container-fluid">
                        <div class="row mt-3">
                            <div class="col-md-4">
                                <section class="image-section">
                                    <h2>Secretariat du 4 septembre</h2>
                                    <div id="carouselExample" class="carousel slide">
                                        <div class="carousel-inner">
                                            <div class="carousel-item active">
                                                <img src="pictures/doc_1_1.png"/>
                                            </div>
                                            <div class="carousel-item">
                                                <img src="pictures/doc_1_2.png"/>
                                            </div>
                                            <div class="carousel-item">
                                                <img src="pictures/doc_1_3.png"/>
                                            </div>
                                        </div>
                                        <button class="carousel-control-prev" type="button"
                                            data-bs-target="#carouselExample" data-bs-slide="prev">
                                            <span class="carousel-control-prev-icon"
                                                aria-hidden="true"/>
                                            <span class="visually-hidden">Previous</span>
                                        </button>
                                        <button class="carousel-control-next" type="button"
                                            data-bs-target="#carouselExample" data-bs-slide="next">
                                            <span class="carousel-control-next-icon"
                                                aria-hidden="true"/>
                                            <span class="visually-hidden">Next</span>
                                        </button>
                                    </div>
                                </section>
                            </div>
                            <div class="col-md-4">
                                <section class="image-section">
                                    <h2>Secretariat du 11 septembre</h2>
                                    <div id="carouselExample2" class="carousel slide">
                                        <div class="carousel-inner">
                                            <div class="carousel-item active">
                                                <img src="pictures/doc_2_1.png"/>
                                            </div>
                                            <div class="carousel-item">
                                                <img src="pictures/doc_2_2.png"/>
                                            </div>
                                        </div>
                                            <button class="carousel-control-prev" type="button"
                                                data-bs-target="#carouselExample2" data-bs-slide="prev">
                                                <span class="carousel-control-prev-icon"
                                                    aria-hidden="true"/>
                                                <span class="visually-hidden">Previous</span>
                                            </button>
                                            <button class="carousel-control-next" type="button"
                                                data-bs-target="#carouselExample2" data-bs-slide="next">
                                                <span class="carousel-control-next-icon"
                                                    aria-hidden="true"/>
                                                <span class="visually-hidden">Next</span>
                                            </button>
                                    </div>
                                </section>
                            </div>
                            <div class="col-md-4">
                                <h2>Secretariat du 18 septembre</h2>
                                <img src="pictures/doc_3.png"/>
                            </div>
                        </div>
                    </main>
                    <xsl:copy-of select="$footer"/>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>

    <!-- Template pour l'index des noms -->
    <xsl:template name="index_name">
        <xsl:result-document href="{$index_name}" method="html" indent="yes">
            <html>
                <xsl:copy-of select="$head"/>
                <body>
                    <xsl:copy-of select="$navbar"/>
                    <main class="container-fluid">
                        <div class="row mt-3 mb-3">
                            <h2 class="offset-2">Index des noms</h2>
                            <div class="col-md-8 offset-2 cadre">
                                <!-- Itération sur chaque personne -->
                                <xsl:for-each select="//listPerson/person">
                                    <div class="person-entry">
                                        <!-- Titre avec les noms (forename et surname) -->
                                        <h5>
                                            <xsl:if test="persName/forename">
                                                <xsl:value-of select="persName/forename"/>
                                                <xsl:text> </xsl:text>
                                            </xsl:if>
                                            <xsl:if test="persName/surname">
                                                <xsl:value-of select="persName/surname"/>
                                            </xsl:if>
                                        </h5>

                                        <!-- Rôle correspondant à cette entité -->
                                        <p>
                                            <xsl:apply-templates select="persName/roleName"/>
                                        </p>
                                        <p>
                                            <xsl:if test="idno">
                                                <strong>Identifiant Wikidata: </strong>
                                                <xsl:for-each select="idno">
                                                  <xsl:value-of select="."/>
                                                </xsl:for-each>
                                            </xsl:if>
                                        </p>
                                        <hr/>
                                    </div>
                                </xsl:for-each>
                            </div>
                        </div>
                    </main>
                    <xsl:copy-of select="$footer"/>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>

    <!-- Template pour l'index des lieux -->
    <xsl:template name="index_lieux">
        <xsl:result-document href="{$index_lieux}" method="html" indent="yes">
            <html>
                <xsl:copy-of select="$head"/>
                <body>
                    <xsl:copy-of select="$navbar"/>
                    <main class="container-fluid">
                        <div class="row mt-3 mb-3">
                            <h2 class="offset-2">Index des lieux</h2>
                            <div class="col-md-8 offset-2 cadre">
                                <!-- Itération sur chaque lieu -->
                                <xsl:for-each select="//listPlace/place">
                                    <div class="place-entry">
                                        <!-- Titre avec le nom du lieu -->
                                        <h5>
                                            <xsl:value-of select="label/name"/>
                                        </h5>

                                        <!-- Affichage des informations de localisation -->
                                        <p>
                                            <xsl:if test="location/geo">
                                                <strong>Location : </strong>
                                                <xsl:for-each select="location/*">
                                                  <!-- Affiche la valeur de l'élément -->
                                                  <xsl:value-of select="."/>

                                                  <!-- Ajoute une virgule sauf pour le dernier élément ou le premier -->
                                                  <xsl:if
                                                  test="position() != last() and position() != 1">,
                                                  </xsl:if>
                                                </xsl:for-each>
                                            </xsl:if>
                                        </p>
                                        <!-- Description du lieu -->
                                        <p>
                                            <xsl:if test="desc">
                                                <strong>Description : </strong>
                                                <xsl:for-each select="desc">
                                                  <xsl:value-of select="."/>
                                                </xsl:for-each>
                                            </xsl:if>
                                        </p>
                                        <p>
                                            <xsl:if test="idno">
                                                <strong>Identifiant Wikidata: </strong>
                                                <xsl:for-each select="idno">
                                                  <xsl:value-of select="."/>
                                                </xsl:for-each>
                                            </xsl:if>
                                        </p>
                                        <hr/>
                                    </div>
                                </xsl:for-each>
                            </div>
                        </div>
                    </main>
                    <xsl:copy-of select="$footer"/>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>

    <xsl:template name="index_organisme">
        <xsl:result-document href="{$index_organisme}" method="html" indent="yes">
            <html>
                <xsl:copy-of select="$head"/>
                <body>
                    <xsl:copy-of select="$navbar"/>
                    <main class="container-fluid">
                        <div class="row mt-3 mb-3">
                            <h2 class="offset-2">Index des organismes</h2>
                            <div class="col-md-8 offset-2 cadre">
                                <!-- Itération sur chaque organisme -->
                                <xsl:for-each select="//listOrg/org">
                                    <div class="org-entry">
                                        <!-- Nom de l'organisme -->
                                        <h5>
                                            <xsl:value-of select="orgName"/>
                                        </h5>

                                        <!-- Affichage des informations de localisation -->
                                        <p>
                                            <xsl:if test="place/location/*">
                                                <!-- Vérifie s'il y a des éléments dans place/location -->
                                                <strong>Location : </strong>
                                                <xsl:for-each select="place/location/*">
                                                  <!-- Affiche la valeur de l'élément -->
                                                  <xsl:value-of select="."/>
                                                  <!-- Ajoute une virgule sauf pour le dernier élément ou le premier -->
                                                  <xsl:if
                                                  test="position() != last() and position() != 1">,
                                                  </xsl:if>
                                                </xsl:for-each>
                                            </xsl:if>
                                        </p>
                                        <p>
                                            <xsl:if test="desc">
                                                <strong>Description : </strong>
                                                <xsl:for-each select="desc">
                                                  <xsl:value-of select="."/>
                                                </xsl:for-each>
                                            </xsl:if>
                                        </p>
                                        <p>
                                            <xsl:if test="idno">
                                                <strong>Identifiant Wikidata: </strong>
                                                <xsl:for-each select="idno">
                                                  <xsl:value-of select="."/>
                                                </xsl:for-each>
                                            </xsl:if>
                                        </p>
                                        <hr/>
                                    </div>
                                </xsl:for-each>
                            </div>
                        </div>
                    </main>
                    <xsl:copy-of select="$footer"/>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
</xsl:stylesheet>
