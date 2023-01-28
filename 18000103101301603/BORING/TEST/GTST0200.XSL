<?xml version="1.0" encoding="shift_jis"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html"/>

<xsl:template match="/">
<HTML>
	<HEAD>
		<B>土質試験及び地盤調査管理（GRNDTST.XML）</B>
		<hr/>
		<TITLE>土質試験及び地盤調査管理（GRNDTST.XML）</TITLE>
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

<xsl:template match="試験情報[1]">
	<table border="1" cellspacing="0" cellpadding="4">
	<font size="+1">

		<xsl:call-template name="createheader"/>

		<xsl:for-each select="../試験情報">
			<xsl:if test="position()=1"><xsl:call-template name="main"/></xsl:if>
			<xsl:if test="position()!=1"><tr><xsl:call-template name="main"/></tr></xsl:if>
		</xsl:for-each>
	</font>
	</table>
</xsl:template>

<xsl:template match="試験情報[position()!=1]"/>

<xsl:template name="createheader">
	<td colspan="30" class="subtitle"><xsl:value-of select="name()"/></td>
	<tr>
	<th colspan="1" rowspan="4" class="subsubtitle">地点名</th>
	<th colspan="1" rowspan="4" class="subsubtitle">フォルダ名</th>
	<th colspan="1" rowspan="4" class="subsubtitle">ボーリング交換用データファイル名</th>
	<td colspan="9" class="subsubtitle">位置情報</td>
	<td colspan="18" rowspan="2" class="subsubtitle">各種試験情報</td>
	</tr>
	<tr>
	<td colspan="3" class="subsubtitle">経度</td>
	<td colspan="3" class="subsubtitle">緯度</td>
	<td colspan="1" rowspan="3" class="subsubtitle">測地系</td>
	<td colspan="1" rowspan="3" class="subsubtitle">標高</td>
	<td colspan="1" rowspan="3" class="subsubtitle">位置情報コメント</td>
	</tr>
	<tr>
	<th rowspan="2">経度_度</th>
	<th rowspan="2">経度_分</th>
	<th rowspan="2">経度_秒</th>
	<th rowspan="2">緯度_度</th>
	<th rowspan="2">緯度_分</th>
	<th rowspan="2">緯度_秒</th>
	<th rowspan="2">電子データシートファイル名</th>
	<th rowspan="2">電子データシート作成ソフトウェア名</th>
	<th rowspan="2">データシート交換用データファイル名</th>
	<th rowspan="2">データシート交換用データ作成ソフトウェア名</th>
	<th rowspan="2">試験コード</th>
	<th rowspan="2">規格番号</th>
	<th rowspan="2">基準番号</th>
	<th rowspan="2">試験名称</th>
	<th rowspan="2">試料番号</th>
	<th rowspan="2">試料採取情報</th>
	<th rowspan="2">試験上端深度</th>
	<th rowspan="2">試験下端深度</th>
	<th rowspan="2">試験開始年月日</th>
	<th rowspan="2">試験終了年月日</th>
	<th rowspan="2">試験者</th>
	<th rowspan="2">各種試験コメント</th>
	<th colspan="2">試料供試体写真情報</th>
	</tr>
	<tr>
	<th>デジタル試料供試体写真ファイル名</th>
	<th>写真内容</th>
	</tr>
</xsl:template>

<xsl:template name="main">
	<xsl:variable name="folderpathA" select="フォルダ名"/>
	<xsl:variable name="shiryokyoshiinfocnt_gene" select="count(各種試験情報)"/>
	
	<xsl:if test="count(地点名)=0">
		<td rowspan="{$shiryokyoshiinfocnt_gene}"><xsl:call-template name="elm-empty"/></td>
	</xsl:if>
	<xsl:if test="count(地点名)!=0">
		<td rowspan="{$shiryokyoshiinfocnt_gene}"><xsl:for-each select="地点名"><xsl:call-template name="textdata"/></xsl:for-each></td>
	</xsl:if>
	<xsl:if test="count(フォルダ名)=0">
		<td rowspan="{$shiryokyoshiinfocnt_gene}"><xsl:call-template name="elm-empty"/></td>
	</xsl:if>
	<xsl:if test="count(フォルダ名)!=0">
		<td rowspan="{$shiryokyoshiinfocnt_gene}"><xsl:for-each select="フォルダ名"><xsl:call-template name="textdata"/></xsl:for-each></td>
	</xsl:if>
	<xsl:if test="count(ボーリング交換用データファイル名)=0">
		<td rowspan="{$shiryokyoshiinfocnt_gene}"><xsl:call-template name="elm-empty"/></td>
	</xsl:if>
	<xsl:if test="count(ボーリング交換用データファイル名)!=0">
		<td rowspan="{$shiryokyoshiinfocnt_gene}">
			<xsl:for-each select="ボーリング交換用データファイル名">
			<a>
				<xsl:attribute name="href">
				..\DATA\<xsl:value-of select="text()"/>
				</xsl:attribute>
				<xsl:value-of select="text()"/>
			</a>
			</xsl:for-each>
		</td>
	</xsl:if>
	<xsl:if test="count(位置情報)=0">
		<td rowspan="{$shiryokyoshiinfocnt_gene}"><xsl:call-template name="elm-empty"/></td>
		<td rowspan="{$shiryokyoshiinfocnt_gene}"><xsl:call-template name="elm-empty"/></td>
		<td rowspan="{$shiryokyoshiinfocnt_gene}"><xsl:call-template name="elm-empty"/></td>
		<td rowspan="{$shiryokyoshiinfocnt_gene}"><xsl:call-template name="elm-empty"/></td>
		<td rowspan="{$shiryokyoshiinfocnt_gene}"><xsl:call-template name="elm-empty"/></td>
		<td rowspan="{$shiryokyoshiinfocnt_gene}"><xsl:call-template name="elm-empty"/></td>
		<td rowspan="{$shiryokyoshiinfocnt_gene}"><xsl:call-template name="elm-empty"/></td>
		<td rowspan="{$shiryokyoshiinfocnt_gene}"><xsl:call-template name="elm-empty"/></td>
		<td rowspan="{$shiryokyoshiinfocnt_gene}"><xsl:call-template name="elm-empty"/></td>
	</xsl:if>
	<xsl:if test="count(位置情報)!=0">
		<xsl:for-each select="位置情報">
			<xsl:if test="count(経度)=0">
				<td rowspan="{$shiryokyoshiinfocnt_gene}"><xsl:call-template name="elm-empty"/></td>
				<td rowspan="{$shiryokyoshiinfocnt_gene}"><xsl:call-template name="elm-empty"/></td>
				<td rowspan="{$shiryokyoshiinfocnt_gene}"><xsl:call-template name="elm-empty"/></td>>
			</xsl:if>
			<xsl:if test="count(経度)!=0">
				<xsl:for-each select="経度">
					<xsl:if test="count(経度_度)=0">
						<td rowspan="{$shiryokyoshiinfocnt_gene}"><xsl:call-template name="elm-empty"/></td>
					</xsl:if>
					<xsl:if test="count(経度_度)!=0">
						<td rowspan="{$shiryokyoshiinfocnt_gene}"><xsl:for-each select="経度_度"><xsl:call-template name="textdata"/></xsl:for-each></td>
					</xsl:if>
					<xsl:if test="count(経度_分)=0">
						<td rowspan="{$shiryokyoshiinfocnt_gene}"><xsl:call-template name="elm-empty"/></td>
					</xsl:if>
					<xsl:if test="count(経度_分)!=0">
						<td rowspan="{$shiryokyoshiinfocnt_gene}"><xsl:for-each select="経度_分"><xsl:call-template name="textdata"/></xsl:for-each></td>
					</xsl:if>
					<xsl:if test="count(経度_秒)=0">
						<td rowspan="{$shiryokyoshiinfocnt_gene}"><xsl:call-template name="elm-empty"/></td>
					</xsl:if>
					<xsl:if test="count(経度_秒)!=0">
						<td rowspan="{$shiryokyoshiinfocnt_gene}"><xsl:for-each select="経度_秒"><xsl:call-template name="textdata"/></xsl:for-each></td>
					</xsl:if>
				</xsl:for-each>
			</xsl:if>
			<xsl:if test="count(緯度)=0">
				<td rowspan="{$shiryokyoshiinfocnt_gene}"><xsl:call-template name="elm-empty"/></td>
				<td rowspan="{$shiryokyoshiinfocnt_gene}"><xsl:call-template name="elm-empty"/></td>
				<td rowspan="{$shiryokyoshiinfocnt_gene}"><xsl:call-template name="elm-empty"/></td>>
			</xsl:if>
			<xsl:if test="count(緯度)!=0">
				<xsl:for-each select="緯度">
					<xsl:if test="count(緯度_度)=0">
						<td rowspan="{$shiryokyoshiinfocnt_gene}"><xsl:call-template name="elm-empty"/></td>
					</xsl:if>
					<xsl:if test="count(緯度_度)!=0">
						<td rowspan="{$shiryokyoshiinfocnt_gene}"><xsl:for-each select="緯度_度"><xsl:call-template name="textdata"/></xsl:for-each></td>
					</xsl:if>
					<xsl:if test="count(緯度_分)=0">
						<td rowspan="{$shiryokyoshiinfocnt_gene}"><xsl:call-template name="elm-empty"/></td>
					</xsl:if>
					<xsl:if test="count(緯度_分)!=0">
						<td rowspan="{$shiryokyoshiinfocnt_gene}"><xsl:for-each select="緯度_分"><xsl:call-template name="textdata"/></xsl:for-each></td>
					</xsl:if>
					<xsl:if test="count(緯度_秒)=0">
						<td rowspan="{$shiryokyoshiinfocnt_gene}"><xsl:call-template name="elm-empty"/></td>
					</xsl:if>
					<xsl:if test="count(緯度_秒)!=0">
						<td rowspan="{$shiryokyoshiinfocnt_gene}"><xsl:for-each select="緯度_秒"><xsl:call-template name="textdata"/></xsl:for-each></td>
					</xsl:if>
				</xsl:for-each>
			</xsl:if>
			<xsl:if test="count(測地系)=0">
				<td rowspan="{$shiryokyoshiinfocnt_gene}"><xsl:call-template name="elm-empty"/></td>
			</xsl:if>
			<xsl:if test="count(測地系)!=0">
				<td rowspan="{$shiryokyoshiinfocnt_gene}"><xsl:for-each select="測地系"><xsl:call-template name="textdata"/></xsl:for-each></td>
			</xsl:if>
			<xsl:if test="count(標高)=0">
				<td rowspan="{$shiryokyoshiinfocnt_gene}"><xsl:call-template name="elm-empty"/></td>
			</xsl:if>
			<xsl:if test="count(標高)!=0">
				<td rowspan="{$shiryokyoshiinfocnt_gene}"><xsl:for-each select="標高"><xsl:call-template name="textdata"/></xsl:for-each></td>
			</xsl:if>
			<xsl:if test="count(位置情報コメント)=0">
				<td rowspan="{$shiryokyoshiinfocnt_gene}"><xsl:call-template name="elm-empty"/></td>
			</xsl:if>
			<xsl:if test="count(位置情報コメント)!=0">
				<td rowspan="{$shiryokyoshiinfocnt_gene}"><xsl:for-each select="位置情報コメント[1]">
					<xsl:for-each select="../位置情報コメント">
						<xsl:if test="position()=1"><xsl:call-template name="textdata"/></xsl:if>
						<xsl:if test="position()!=1">,<xsl:call-template name="textdata"/></xsl:if>
					</xsl:for-each>
				</xsl:for-each></td>
			</xsl:if>
		</xsl:for-each>
	</xsl:if>
	
	<xsl:for-each select="各種試験情報">
		<xsl:if test="position()=1">
			 <xsl:call-template name="kakushusikeninfo">
				<xsl:with-param name="folderpathA"><xsl:value-of select="$folderpathA"/></xsl:with-param>
			 </xsl:call-template>
		</xsl:if>
		<xsl:if test="position()!=1">
			<tr>
				<xsl:call-template name="kakushusikeninfo">
					<xsl:with-param name="folderpathA"><xsl:value-of select="$folderpathA"/></xsl:with-param>
				</xsl:call-template>
			</tr>
		</xsl:if>
	</xsl:for-each>

</xsl:template>

<xsl:template name="kakushusikeninfo">
	<xsl:param name="folderpathA"/>
	<xsl:variable name="shiryokyoshiinfocnt_each" select="count(試料供試体写真情報)"/>

	<!--<xsl:for-each select="../フォルダ名">
		<xsl:variable name="foldername"><xsl:value-of select="."/></xsl:variable>
		<td><xsl:for-each select="../各種試験情報/電子データシートファイル名"><xsl:apply-templates/></xsl:for-each></td>
	</xsl:for-each>-->
	<xsl:if test="count(電子データシートファイル名)=0">
		<td><xsl:call-template name="elm-empty"/></td>
	</xsl:if>
	<xsl:if test="count(電子データシートファイル名)!=0">
		<td>
			<xsl:for-each select="電子データシートファイル名">
				<a>
					<xsl:attribute name="href">
					.\<xsl:value-of select="$folderpathA" />
					\<xsl:value-of select="text()"/>
					</xsl:attribute>
					<xsl:value-of select="text()"/>
				</a>
			</xsl:for-each>
		</td>
	</xsl:if>
	<xsl:if test="count(電子データシート作成ソフトウェア名)=0">
		<td><xsl:call-template name="elm-empty"/></td>
	</xsl:if>
	<xsl:if test="count(電子データシート作成ソフトウェア名)!=0">
		<td><xsl:for-each select="電子データシート作成ソフトウェア名"><xsl:call-template name="textdata"/></xsl:for-each></td>
	</xsl:if>
	<xsl:if test="count(データシート交換用データファイル名)=0">
		<td><xsl:call-template name="elm-empty"/></td>
	</xsl:if>
	<xsl:if test="count(データシート交換用データファイル名)!=0">
		<td>
			<xsl:for-each select="データシート交換用データファイル名">
				<a>
					<xsl:attribute name="href">
					.\<xsl:value-of select="$folderpathA" />
					\<xsl:value-of select="text()"/>
					</xsl:attribute>
					<xsl:call-template name="textdata"/>
				</a>
			</xsl:for-each>
		</td>
	</xsl:if>
	<xsl:if test="count(データシート交換用データ作成ソフトウェア名)=0">
		<td><xsl:call-template name="elm-empty"/></td>
	</xsl:if>
	<xsl:if test="count(データシート交換用データ作成ソフトウェア名)!=0">
		<td><xsl:for-each select="データシート交換用データ作成ソフトウェア名"><xsl:call-template name="textdata"/></xsl:for-each></td>
	</xsl:if>
	<xsl:if test="count(試験コード)=0">
		<td><xsl:call-template name="elm-empty"/></td>
	</xsl:if>
	<xsl:if test="count(試験コード)!=0">
		<td><xsl:for-each select="試験コード"><xsl:call-template name="textdata"/></xsl:for-each></td>
	</xsl:if>
	<xsl:if test="count(規格番号)=0">
		<td><xsl:call-template name="elm-empty"/></td>
	</xsl:if>
	<xsl:if test="count(規格番号)!=0">
		<td><xsl:for-each select="規格番号"><xsl:call-template name="textdata"/></xsl:for-each></td>
	</xsl:if>
	<xsl:if test="count(基準番号)=0">
		<td><xsl:call-template name="elm-empty"/></td>
	</xsl:if>
	<xsl:if test="count(基準番号)!=0">
		<td><xsl:for-each select="基準番号"><xsl:call-template name="textdata"/></xsl:for-each></td>
	</xsl:if>
	<xsl:if test="count(試験名称)=0">
		<td><xsl:call-template name="elm-empty"/></td>
	</xsl:if>
	<xsl:if test="count(試験名称)!=0">
		<td><xsl:for-each select="試験名称"><xsl:call-template name="textdata"/></xsl:for-each></td>
	</xsl:if>
	<xsl:if test="count(試料番号)=0">
		<td><xsl:call-template name="elm-empty"/></td>
	</xsl:if>
	<xsl:if test="count(試料番号)!=0">
		<td><xsl:for-each select="試料番号"><xsl:call-template name="textdata"/></xsl:for-each></td>
	</xsl:if>
	<xsl:if test="count(試料採取情報)=0">
		<td><xsl:call-template name="elm-empty"/></td>
	</xsl:if>
	<xsl:if test="count(試料採取情報)!=0">
		<td><xsl:for-each select="試料採取情報"><xsl:call-template name="textdata"/></xsl:for-each></td>
	</xsl:if>
	<xsl:if test="count(試験上端深度)=0">
		<td><xsl:call-template name="elm-empty"/></td>
	</xsl:if>
	<xsl:if test="count(試験上端深度)!=0">
		<td><xsl:for-each select="試験上端深度"><xsl:call-template name="textdata"/></xsl:for-each></td>
	</xsl:if>
	<xsl:if test="count(試験下端深度)=0">
		<td><xsl:call-template name="elm-empty"/></td>
	</xsl:if>
	<xsl:if test="count(試験下端深度)!=0">
		<td><xsl:for-each select="試験下端深度"><xsl:call-template name="textdata"/></xsl:for-each></td>
	</xsl:if>
	<xsl:if test="count(試験開始年月日)=0">
		<td><xsl:call-template name="elm-empty"/></td>
	</xsl:if>
	<xsl:if test="count(試験開始年月日)!=0">
		<td><xsl:for-each select="試験開始年月日"><xsl:call-template name="textdata"/></xsl:for-each></td>
	</xsl:if>
	<xsl:if test="count(試験終了年月日)=0">
		<td><xsl:call-template name="elm-empty"/></td>
	</xsl:if>
	<xsl:if test="count(試験終了年月日)!=0">
		<td><xsl:for-each select="試験終了年月日"><xsl:call-template name="textdata"/></xsl:for-each></td>
	</xsl:if>
	<xsl:if test="count(試験者)=0">
		<td><xsl:call-template name="elm-empty"/></td>
	</xsl:if>
	<xsl:if test="count(試験者)!=0">
		<td><xsl:for-each select="試験者"><xsl:call-template name="textdata"/></xsl:for-each></td>
	</xsl:if>
	<xsl:if test="count(各種試験コメント)=0">
		<td><xsl:call-template name="elm-empty"/></td>
	</xsl:if>
	<xsl:if test="count(各種試験コメント)!=0">
		<td><xsl:for-each select="各種試験コメント[1]">
			<xsl:for-each select="../各種試験コメント">
				<xsl:if test="position()=1"><xsl:call-template name="textdata"/></xsl:if>
				<xsl:if test="position()!=1">,<xsl:call-template name="textdata"/></xsl:if>
			</xsl:for-each>
			</xsl:for-each>
		</td>
	</xsl:if>
	<xsl:if test="count(試料供試体写真情報)=0">
		<td colspan="2"><xsl:call-template name="elm-empty"/></td>
	</xsl:if>
	<xsl:if test="count(試料供試体写真情報)!=0">
		<td colspan="2">
			<table cellpadding="1" cellspacing="0" border="1" style="text-align: left; width: 100%;">
				<xsl:for-each select="試料供試体写真情報">
					<xsl:call-template name="shiryokyoshiinfo">
						<xsl:with-param name="folderpathA"><xsl:value-of select="$folderpathA"/></xsl:with-param>
					</xsl:call-template>
				</xsl:for-each>
			</table>
		</td>
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

<xsl:template name="shiryokyoshiinfo">
	<xsl:param name="folderpathA"/>
	
	<tr>
		<td>
			<xsl:if test="count(デジタル試料供試体写真ファイル名)=0">
				<xsl:call-template name="elm-empty"/>
			</xsl:if>
			<xsl:if test="count(デジタル試料供試体写真ファイル名)!=0">
				<xsl:for-each select="デジタル試料供試体写真ファイル名">
					<a>
						<xsl:attribute name="href">
						.\<xsl:value-of select="$folderpathA" />
						\TESTPIC
						\<xsl:value-of select="text()"/>
						</xsl:attribute>
						<xsl:call-template name="textdata"/>
					</a>
				</xsl:for-each>
			</xsl:if>
		</td>
		<td>
			<xsl:if test="count(写真内容)=0">
				<xsl:call-template name="elm-empty"/>
			</xsl:if>
			<xsl:if test="count(写真内容)!=0">
				<xsl:for-each select="写真内容"><xsl:call-template name="textdata"/></xsl:for-each>
			</xsl:if>
		</td>
	</tr>
</xsl:template>


</xsl:stylesheet>