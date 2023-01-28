<?xml version="1.0" encoding="shift_jis"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html"/>

<xsl:template match="/">
<HTML>
	<HEAD>
		<B>�R�A�ʐ^�Ǘ��iCOREPIC.XML�j</B>
		<hr/>
		<TITLE>�R�A�ʐ^�Ǘ��iCOREPIC.XML�j</TITLE>
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

<xsl:template match="��b���">

	<table border="1" cellspacing="0" cellpadding="4">
	<FONT size="+1">
		<xsl:for-each select="../��b���">
			<tr>
			<td colspan="1" rowspan="1" class="subtitle"><xsl:value-of select="name()"/></td>
				<td class="subsubsubtitle">�K�p�v�̊</td>
				<xsl:variable name="elm-cnt" select="count(�K�p�v�̊)"/>
				<xsl:if test="$elm-cnt=0"><td><xsl:call-template name="elm-empty"/></td></xsl:if>
				<xsl:if test="$elm-cnt!=0">
					<xsl:for-each select="�K�p�v�̊">
					<td><xsl:call-template name="textdata"/></td>
					</xsl:for-each>
				</xsl:if>
			</tr>
		</xsl:for-each>

		<xsl:for-each select="../�R�����g">
			<xsl:variable name="cnt" select="count(../�R�����g)"/>
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

		<xsl:for-each select="../�\�t�g���[�J�pTAG">
			<xsl:variable name="cnt" select="count(../�\�t�g���[�J�pTAG)"/>
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

<xsl:template match="�f�W�^���R�A�ʐ^���[1]">
	<table border="1" cellspacing="0" cellpadding="4">
	<font size="+1">
		<td colspan="19" class="subtitle"><xsl:value-of select="name()"/></td>
		<tr>
		<th>�ʐ^�t�@�C����</th>
		<th>�{�[�����O��</th>
		<th>�{�[�����O�A��</th>
		<th>�R�A��[�[�x</th>
		<th>�R�A���[�[�x</th>
		<th>�B�e�N����</th>
		<th>�B�e����</th>
		<th>�B�e���V��</th>
		<th>�B�e�ӏ�</th>
		<th>�R�A�ʐ^�R�����g</th>
		</tr>

		<xsl:for-each select="../�f�W�^���R�A�ʐ^���">
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

<xsl:template match="�f�W�^���R�A�ʐ^���[position()!=1]"/>
<xsl:template match="�R�����g"/>
<xsl:template match="�\�t�g���[�J�pTAG"/>

<xsl:template name="main">
	<xsl:if test="count(�ʐ^�t�@�C����)=0">
		<td><xsl:call-template name="elm-empty"/></td>
	</xsl:if>
	<xsl:if test="count(�ʐ^�t�@�C����)!=0">
		<td>
			<xsl:for-each select="�ʐ^�t�@�C����">
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
	<xsl:if test="count(�{�[�����O��)=0">
		<td><xsl:call-template name="elm-empty"/></td>
	</xsl:if>
	<xsl:if test="count(�{�[�����O��)!=0">
		<td><xsl:for-each select="�{�[�����O��"><xsl:call-template name="textdata"/></xsl:for-each></td>
	</xsl:if>
	<xsl:if test="count(�{�[�����O�A��)=0">
		<td><xsl:call-template name="elm-empty"/></td>
	</xsl:if>
	<xsl:if test="count(�{�[�����O�A��)!=0">
		<td><xsl:for-each select="�{�[�����O�A��"><xsl:call-template name="textdata"/></xsl:for-each></td>
	</xsl:if>
	<xsl:if test="count(�R�A��[�[�x)=0">
		<td><xsl:call-template name="elm-empty"/></td>
	</xsl:if>
	<xsl:if test="count(�R�A��[�[�x)!=0">
		<td><xsl:for-each select="�R�A��[�[�x"><xsl:call-template name="textdata"/></xsl:for-each></td>
	</xsl:if>
	<xsl:if test="count(�R�A���[�[�x)=0">
		<td><xsl:call-template name="elm-empty"/></td>
	</xsl:if>
	<xsl:if test="count(�R�A���[�[�x)!=0">
		<td><xsl:for-each select="�R�A���[�[�x"><xsl:call-template name="textdata"/></xsl:for-each></td>
	</xsl:if>
	<xsl:if test="count(�B�e�N����)=0">
		<td><xsl:call-template name="elm-empty"/></td>
	</xsl:if>
	<xsl:if test="count(�B�e�N����)!=0">
		<td><xsl:for-each select="�B�e�N����"><xsl:call-template name="textdata"/></xsl:for-each></td>
	</xsl:if>
	<xsl:if test="count(�B�e����)=0">
		<td><xsl:call-template name="elm-empty"/></td>
	</xsl:if>
	<xsl:if test="count(�B�e����)!=0">
		<td><xsl:for-each select="�B�e����"><xsl:call-template name="textdata"/></xsl:for-each></td>
	</xsl:if>
	<xsl:if test="count(�B�e���V��)=0">
		<td><xsl:call-template name="elm-empty"/></td>
	</xsl:if>
	<xsl:if test="count(�B�e���V��)!=0">
		<td><xsl:for-each select="�B�e���V��"><xsl:call-template name="textdata"/></xsl:for-each></td>
	</xsl:if>
	<xsl:if test="count(�B�e�ӏ�)=0">
		<td><xsl:call-template name="elm-empty"/></td>
	</xsl:if>
	<xsl:if test="count(�B�e�ӏ�)!=0">
		<td><xsl:for-each select="�B�e�ӏ�"><xsl:call-template name="textdata"/></xsl:for-each></td>
	</xsl:if>
	<xsl:if test="count(�R�A�ʐ^�R�����g)=0">
		<td><xsl:call-template name="elm-empty"/></td>
	</xsl:if>
	<xsl:if test="count(�R�A�ʐ^�R�����g)!=0">
		<td><xsl:for-each select="�R�A�ʐ^�R�����g"><xsl:call-template name="textdata"/></xsl:for-each></td>
	</xsl:if>
</xsl:template>

<xsl:template name="textdata">
	<xsl:variable name="char-cnt" select="string-length()"/>
	<xsl:if test="$char-cnt=0"><xsl:call-template name="elm-empty"/></xsl:if>
	<xsl:if test="$char-cnt!=0"><xsl:apply-templates/></xsl:if>
</xsl:template>

<xsl:template name="elm-empty">
	<xsl:text><!--��̃X�y�[�X��}�����܂��B-->�@</xsl:text>
</xsl:template>
</xsl:stylesheet>