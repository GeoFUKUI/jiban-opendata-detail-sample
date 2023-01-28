<?xml version="1.0" encoding="shift_jis"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html"/>

<xsl:template match="/">
<HTML>
	<HEAD>
		<B>地質情報管理（BORING.XML）</B>
		<hr/>
		<TITLE>地質情報管理（BORING.XML）</TITLE>
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
			<xsl:variable name="cnt0" select="count(../コメント)"/>
			<xsl:if test="$cnt0=0"><td><xsl:call-template name="elm-empty"/></td></xsl:if>
			<xsl:if test="$cnt0!=0">
				<tr>
				<xsl:if test="position()=1">
					<td colspan="2" rowspan="{$cnt0}" class="subtitle"><xsl:value-of select="name()"/></td>
				</xsl:if>
				<td><xsl:value-of select="."/></td>
				</tr>
			</xsl:if>
		</xsl:for-each>

		<xsl:for-each select="../ソフトメーカ用TAG">
			<xsl:variable name="cnt1" select="count(../ソフトメーカ用TAG)"/>
			<xsl:if test="$cnt1=0"><td><xsl:call-template name="elm-empty"/></td></xsl:if>
			<xsl:if test="$cnt1!=0">
				<tr>
				<xsl:if test="position()=1">
					<td colspan="2" rowspan="{$cnt1}" class="subtitle"><xsl:value-of select="name()"/></td>
				</xsl:if>
				<td><xsl:value-of select="."/></td>
				</tr>
			</xsl:if>
		</xsl:for-each>


	</FONT>
	</table>
	<P/>

</xsl:template>

<xsl:template match="コメント"/>
<xsl:template match="ソフトメーカ用TAG"/>

<xsl:template match="ボーリング情報[1]">
	<table border="1" cellspacing="0" cellpadding="4">
	<font size="+1">

		<xsl:call-template name="createheader"/>

		<xsl:for-each select="../ボーリング情報">
			<xsl:if test="position()=1"><xsl:call-template name="main"/></xsl:if>
			<xsl:if test="position()!=1"><tr><xsl:call-template name="main"/></tr></xsl:if>
		</xsl:for-each>
	</font>
	</table>
</xsl:template>

<xsl:template match="ボーリング情報[position()!=1]"/>
<xsl:template match="コメント"/>

<xsl:template name="createheader">
	<td colspan="19" class="subtitle"><xsl:value-of select="name()"/></td>

	<tr>
	<td colspan="1" rowspan="2" class="subsubtitle">ボーリング名</td>
	<td colspan="1" rowspan="2" class="subsubtitle">ボーリング連番</td>
	<td colspan="3" rowspan="1" class="subsubtitle">経度</td>
	<td colspan="3" rowspan="1" class="subsubtitle">緯度</td>
	<td colspan="1" rowspan="2" class="subsubtitle">測地系</td>
	<td colspan="1" rowspan="2" class="subsubtitle">孔口標高</td>
	<td colspan="1" rowspan="2" class="subsubtitle">掘進長</td>
	<td colspan="1" rowspan="2" class="subsubtitle">柱状図区分</td>
	<td colspan="1" rowspan="2" class="subsubtitle">ボーリングコメント</td>
	<td colspan="2" rowspan="1" class="subsubtitle">ボーリング交換用データ</td>
	<td colspan="2" rowspan="1" class="subsubtitle">電子柱状図</td>
	<td colspan="2" rowspan="1" class="subsubtitle">電子簡略柱状図</td>
	</tr>
	<tr>
	<th>経度_度</th>
	<th>経度_分</th>
	<th>経度_秒</th>
	<th>緯度_度</th>
	<th>緯度_分</th>
	<th>緯度_秒</th>
	<th>ボーリング交換用データファイル名</th>
	<th>ボーリング交換用データ作成ソフトウェア名</th>
	<th>電子柱状図ファイル名</th>
	<th>電子柱状図作成ソフトウェア名</th>
	<th>電子簡略柱状図ファイル名</th>
	<th>電子簡略柱状図作成ソフトウェア名</th>
	</tr>
</xsl:template>

<xsl:template name="main">
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
	<xsl:if test="count(経度)=0">
		<td><xsl:call-template name="elm-empty"/></td>
		<td><xsl:call-template name="elm-empty"/></td>
		<td><xsl:call-template name="elm-empty"/></td>
	</xsl:if>
	<xsl:if test="count(経度)!=0">
		<xsl:for-each select="経度">
			<xsl:if test="count(経度_度)=0">
				<td><xsl:call-template name="elm-empty"/></td>
			</xsl:if>
			<xsl:if test="count(経度_度)!=0">
				<td><xsl:for-each select="経度_度"><xsl:call-template name="textdata"/></xsl:for-each></td>
			</xsl:if>
			<xsl:if test="count(経度_分)=0">
				<td><xsl:call-template name="elm-empty"/></td>
			</xsl:if>
			<xsl:if test="count(経度_分)!=0">
				<td><xsl:for-each select="経度_分"><xsl:call-template name="textdata"/></xsl:for-each></td>
			</xsl:if>
			<xsl:if test="count(経度_秒)=0">
				<td><xsl:call-template name="elm-empty"/></td>
			</xsl:if>
			<xsl:if test="count(経度_秒)!=0">
				<td><xsl:for-each select="経度_秒"><xsl:call-template name="textdata"/></xsl:for-each></td>
			</xsl:if>
		</xsl:for-each>
	</xsl:if>
	<xsl:if test="count(緯度)=0">
		<td><xsl:call-template name="elm-empty"/></td>
		<td><xsl:call-template name="elm-empty"/></td>
		<td><xsl:call-template name="elm-empty"/></td>
	</xsl:if>
	<xsl:if test="count(緯度)!=0">
		<xsl:for-each select="緯度">
			<xsl:if test="count(緯度_度)=0">
				<td><xsl:call-template name="elm-empty"/></td>
			</xsl:if>
			<xsl:if test="count(緯度_度)!=0">
				<td><xsl:for-each select="緯度_度"><xsl:call-template name="textdata"/></xsl:for-each></td>
			</xsl:if>
			<xsl:if test="count(緯度_分)=0">
				<td><xsl:call-template name="elm-empty"/></td>
			</xsl:if>
			<xsl:if test="count(緯度_分)!=0">
				<td><xsl:for-each select="緯度_分"><xsl:call-template name="textdata"/></xsl:for-each></td>
			</xsl:if>
			<xsl:if test="count(緯度_秒)=0">
				<td><xsl:call-template name="elm-empty"/></td>
			</xsl:if>
			<xsl:if test="count(緯度_秒)!=0">
				<td><xsl:for-each select="緯度_秒"><xsl:call-template name="textdata"/></xsl:for-each></td>
			</xsl:if>
		</xsl:for-each>
	</xsl:if>
	<xsl:if test="count(測地系)=0">
		<td><xsl:call-template name="elm-empty"/></td>
	</xsl:if>
	<xsl:if test="count(測地系)!=0">
		<td><xsl:for-each select="測地系"><xsl:call-template name="textdata"/></xsl:for-each></td>
	</xsl:if>
	<xsl:if test="count(孔口標高)=0">
		<td><xsl:call-template name="elm-empty"/></td>
	</xsl:if>
	<xsl:if test="count(孔口標高)!=0">
		<td><xsl:for-each select="孔口標高"><xsl:call-template name="textdata"/></xsl:for-each></td>
	</xsl:if>
	<xsl:if test="count(掘進長)=0">
		<td><xsl:call-template name="elm-empty"/></td>
	</xsl:if>
	<xsl:if test="count(掘進長)!=0">
		<td><xsl:for-each select="掘進長"><xsl:call-template name="textdata"/></xsl:for-each></td>
	</xsl:if>
	<xsl:if test="count(柱状図区分)=0">
		<td><xsl:call-template name="elm-empty"/></td>
	</xsl:if>
	<xsl:if test="count(柱状図区分)!=0">
		<td><xsl:for-each select="柱状図区分"><xsl:call-template name="textdata"/></xsl:for-each></td>
	</xsl:if>
	<xsl:if test="count(ボーリングコメント)=0">
		<td><xsl:call-template name="elm-empty"/></td>
	</xsl:if>
	<xsl:if test="count(ボーリングコメント)!=0">
		<td><xsl:for-each select="ボーリングコメント[1]">
			<xsl:for-each select="../ボーリングコメント">
				<xsl:if test="position()=1"><xsl:call-template name="textdata"/></xsl:if>
				<xsl:if test="position()!=1">,<xsl:call-template name="textdata"/></xsl:if>
			</xsl:for-each>
		</xsl:for-each></td>
	</xsl:if>
	<xsl:if test="count(ボーリング交換用データ)=0">
		<td><xsl:call-template name="elm-empty"/></td>
		<td><xsl:call-template name="elm-empty"/></td>		
	</xsl:if>
	<xsl:if test="count(ボーリング交換用データ)!=0">
		<xsl:for-each select="ボーリング交換用データ">
			<td>
				<xsl:for-each select="ボーリング交換用データファイル名">
					<xsl:variable name="char-cnt" select="string-length()"/>
					<xsl:if test="$char-cnt=0"><xsl:call-template name="elm-empty"/></xsl:if>
					<xsl:if test="$char-cnt!=0">
						<a><xsl:attribute name="href">
							.\DATA\<xsl:value-of select="text()"/>
							</xsl:attribute><xsl:value-of select="text()"/>
						</a>
					</xsl:if>
				</xsl:for-each>
			</td>
			<td>
				<xsl:for-each select="ボーリング交換用データ作成ソフトウェア名">
					<xsl:call-template name="textdata"/>
				</xsl:for-each>
			</td>
		</xsl:for-each>
	</xsl:if>
	<xsl:if test="count(電子柱状図)=0">
		<td><xsl:call-template name="elm-empty"/></td>
	</xsl:if>
	<xsl:if test="count(電子柱状図)!=0">
		<xsl:for-each select="電子柱状図">
			<td>
				<xsl:for-each select="電子柱状図ファイル名">
					<xsl:variable name="char-cnt" select="string-length()"/>
					<xsl:if test="$char-cnt=0"><xsl:call-template name="elm-empty"/></xsl:if>
					<xsl:if test="$char-cnt!=0">
						<a><xsl:attribute name="href">
							.\LOG\<xsl:value-of select="text()"/>
							</xsl:attribute><xsl:value-of select="text()"/>
						</a>
					</xsl:if>
				</xsl:for-each>
			</td>
			<td><xsl:for-each select="電子柱状図作成ソフトウェア名"><xsl:call-template name="textdata"/></xsl:for-each></td>
		</xsl:for-each>
	</xsl:if>
	<xsl:if test="count(電子簡略柱状図)=0">
		<td><xsl:call-template name="elm-empty"/></td>
	</xsl:if>
	<xsl:if test="count(電子簡略柱状図)!=0">
		<xsl:for-each select="電子簡略柱状図">
			<td>
				<xsl:for-each select="電子簡略柱状図ファイル名">
					<xsl:variable name="char-cnt" select="string-length()"/>
					<xsl:if test="$char-cnt=0"><xsl:call-template name="elm-empty"/></xsl:if>
					<xsl:if test="$char-cnt!=0">
						<a><xsl:attribute name="href">
							.\DRA\<xsl:value-of select="text()"/>
							</xsl:attribute><xsl:value-of select="text()"/>
						</a>
					</xsl:if>
				</xsl:for-each>
			</td>
			<td><xsl:for-each select="電子簡略柱状図作成ソフトウェア名"><xsl:call-template name="textdata"/></xsl:for-each></td>
		</xsl:for-each>
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