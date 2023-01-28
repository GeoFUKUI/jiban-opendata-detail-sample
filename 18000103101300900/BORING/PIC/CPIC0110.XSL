<?xml version="1.0" encoding="shift_jis"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html"/>

<xsl:template match="/">
<HTML>
	<HEAD>
		<B>コア写真管理（COREPIC.XML）</B>
		<hr/>
		<TITLE>コア写真管理（COREPIC.XML）</TITLE>
		<STYLE type="text/css">
			td {font-size: 10pt;}
			th {font-size: 10pt; background-color: LightCyan}
			.subtitle {background-color: RoyalBlue; font-weight: bold; color: white}
			.subsubtitle {background-color: PaleTurquoise; font-weight: bold; color: black}
			.subsubsubtitle {background-color: LightCyan; font-weight: bold; color: black}
		</STYLE>
	</HEAD>
	<BODY>
		<xsl:apply-templates/>
	</BODY>
</HTML>
<P/>

</xsl:template>

<xsl:template match="基礎情報">

	<table border="1" cellspacing="0" cellpadding="4">
	<FONT size="+1">
		<xsl:for-each select="../基礎情報">
			<tr>
			<td colspan="1" rowspan="1" class="subtitle"><xsl:value-of select="name()"/></td>
				<td class="subsubsubtitle">適用要領基準</td>
				<xsl:variable name="elm-cnt" select="count(適用要領基準)"/>
				<xsl:if test="$elm-cnt=0"><td><xsl:call-template name="elm-empty"/></td></xsl:if>
				<xsl:if test="$elm-cnt!=0">
					<xsl:for-each select="適用要領基準">
					<td><xsl:call-template name="textdata"/></td>
					</xsl:for-each>
				</xsl:if>
			</tr>
		</xsl:for-each>

		<xsl:for-each select="../コメント">
			<xsl:variable name="cnt" select="count(../コメント)"/>
			<xsl:if test="$cnt=0"><td><xsl:call-template name="elm-empty"/></td></xsl:if>
			<xsl:if test="$cnt!=0">
				<tr>
				<xsl:if test="position()=1">
					<td colspan="2" rowspan="{$cnt}" class="subtitle"><xsl:value-of select="name()"/></td>
				</xsl:if>
				<td><xsl:value-of select="."/></td>
				</tr>
			</xsl:if>
		</xsl:for-each>

		<xsl:for-each select="../ソフトメーカ用TAG">
			<xsl:variable name="cnt" select="count(../ソフトメーカ用TAG)"/>
			<xsl:if test="$cnt=0"><td><xsl:call-template name="elm-empty"/></td></xsl:if>
			<xsl:if test="$cnt!=0">
				<tr>
				<xsl:if test="position()=1">
					<td colspan="2" rowspan="{$cnt}" class="subtitle"><xsl:value-of select="name()"/></td>
				</xsl:if>
				<td><xsl:value-of select="."/></td>
				</tr>
			</xsl:if>
		</xsl:for-each>


	</FONT>
	</table>
	<P/>

</xsl:template>

<xsl:template match="デジタルコア写真情報[1]">
	<table border="1" cellspacing="0" cellpadding="4">
	<font size="+1">
		<td colspan="19" class="subtitle"><xsl:value-of select="name()"/></td>
		<tr>
		<th>写真ファイル名</th>
		<th>ボーリング名</th>
		<th>ボーリング連番</th>
		<th>コア上端深度</th>
		<th>コア下端深度</th>
		<th>撮影年月日</th>
		<th>撮影時間</th>
		<th>撮影日天候</th>
		<th>撮影箇所</th>
		<th>コア写真コメント</th>
		</tr>

		<xsl:for-each select="../デジタルコア写真情報">
			<xsl:if test="position()=1">
				<xsl:call-template name="main"/>
			</xsl:if>
			<xsl:if test="position()!=1">
				<tr>
				<xsl:call-template name="main"/>
				</tr>
			</xsl:if>
		</xsl:for-each>
	</font>
	</table>
</xsl:template>

<xsl:template match="デジタルコア写真情報[position()!=1]"/>
<xsl:template match="コメント"/>
<xsl:template match="ソフトメーカ用TAG"/>

<xsl:template name="main">
	<xsl:if test="count(写真ファイル名)=0">
		<td><xsl:call-template name="elm-empty"/></td>
	</xsl:if>
	<xsl:if test="count(写真ファイル名)!=0">
		<td>
			<xsl:for-each select="写真ファイル名">
				<xsl:variable name="char-cnt" select="string-length()"/>
				<xsl:if test="$char-cnt=0"><xsl:call-template name="elm-empty"/></xsl:if>
				<xsl:if test="$char-cnt!=0">
					<a><xsl:attribute name="href">
						.\<xsl:value-of select="text()"/>
						</xsl:attribute><xsl:value-of select="text()"/>
					</a>
				</xsl:if>
			</xsl:for-each>
		</td>
	</xsl:if>
	<xsl:if test="count(ボーリング名)=0">
		<td><xsl:call-template name="elm-empty"/></td>
	</xsl:if>
	<xsl:if test="count(ボーリング名)!=0">
		<td><xsl:for-each select="ボーリング名"><xsl:call-template name="textdata"/></xsl:for-each></td>
	</xsl:if>
	<xsl:if test="count(ボーリング連番)=0">
		<td><xsl:call-template name="elm-empty"/></td>
	</xsl:if>
	<xsl:if test="count(ボーリング連番)!=0">
		<td><xsl:for-each select="ボーリング連番"><xsl:call-template name="textdata"/></xsl:for-each></td>
	</xsl:if>
	<xsl:if test="count(コア上端深度)=0">
		<td><xsl:call-template name="elm-empty"/></td>
	</xsl:if>
	<xsl:if test="count(コア上端深度)!=0">
		<td><xsl:for-each select="コア上端深度"><xsl:call-template name="textdata"/></xsl:for-each></td>
	</xsl:if>
	<xsl:if test="count(コア下端深度)=0">
		<td><xsl:call-template name="elm-empty"/></td>
	</xsl:if>
	<xsl:if test="count(コア下端深度)!=0">
		<td><xsl:for-each select="コア下端深度"><xsl:call-template name="textdata"/></xsl:for-each></td>
	</xsl:if>
	<xsl:if test="count(撮影年月日)=0">
		<td><xsl:call-template name="elm-empty"/></td>
	</xsl:if>
	<xsl:if test="count(撮影年月日)!=0">
		<td><xsl:for-each select="撮影年月日"><xsl:call-template name="textdata"/></xsl:for-each></td>
	</xsl:if>
	<xsl:if test="count(撮影時間)=0">
		<td><xsl:call-template name="elm-empty"/></td>
	</xsl:if>
	<xsl:if test="count(撮影時間)!=0">
		<td><xsl:for-each select="撮影時間"><xsl:call-template name="textdata"/></xsl:for-each></td>
	</xsl:if>
	<xsl:if test="count(撮影日天候)=0">
		<td><xsl:call-template name="elm-empty"/></td>
	</xsl:if>
	<xsl:if test="count(撮影日天候)!=0">
		<td><xsl:for-each select="撮影日天候"><xsl:call-template name="textdata"/></xsl:for-each></td>
	</xsl:if>
	<xsl:if test="count(撮影箇所)=0">
		<td><xsl:call-template name="elm-empty"/></td>
	</xsl:if>
	<xsl:if test="count(撮影箇所)!=0">
		<td><xsl:for-each select="撮影箇所"><xsl:call-template name="textdata"/></xsl:for-each></td>
	</xsl:if>
	<xsl:if test="count(コア写真コメント)=0">
		<td><xsl:call-template name="elm-empty"/></td>
	</xsl:if>
	<xsl:if test="count(コア写真コメント)!=0">
		<td><xsl:for-each select="コア写真コメント"><xsl:call-template name="textdata"/></xsl:for-each></td>
	</xsl:if>
</xsl:template>

<xsl:template name="textdata">
	<xsl:variable name="char-cnt" select="string-length()"/>
	<xsl:if test="$char-cnt=0"><xsl:call-template name="elm-empty"/></xsl:if>
	<xsl:if test="$char-cnt!=0"><xsl:apply-templates/></xsl:if>
</xsl:template>

<xsl:template name="elm-empty">
	<xsl:text><!--空のスペースを挿入します。-->　</xsl:text>
</xsl:template>
</xsl:stylesheet>