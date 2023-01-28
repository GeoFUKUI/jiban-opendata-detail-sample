<?xml version="1.0" encoding="shift_jis"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html"/>

<xsl:template match="/">
<HTML>
	<HEAD>
		<B>�n�����Ǘ��iBORING.XML�j</B>
		<hr/>
		<TITLE>�n�����Ǘ��iBORING.XML�j</TITLE>
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
			<xsl:variable name="cnt0" select="count(../�R�����g)"/>
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

		<xsl:for-each select="../�\�t�g���[�J�pTAG">
			<xsl:variable name="cnt1" select="count(../�\�t�g���[�J�pTAG)"/>
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

<xsl:template match="�R�����g"/>
<xsl:template match="�\�t�g���[�J�pTAG"/>

<xsl:template match="�{�[�����O���[1]">
	<table border="1" cellspacing="0" cellpadding="4">
	<font size="+1">

		<xsl:call-template name="createheader"/>

		<xsl:for-each select="../�{�[�����O���">
			<xsl:if test="position()=1"><xsl:call-template name="main"/></xsl:if>
			<xsl:if test="position()!=1"><tr><xsl:call-template name="main"/></tr></xsl:if>
		</xsl:for-each>
	</font>
	</table>
</xsl:template>

<xsl:template match="�{�[�����O���[position()!=1]"/>
<xsl:template match="�R�����g"/>

<xsl:template name="createheader">
	<td colspan="19" class="subtitle"><xsl:value-of select="name()"/></td>

	<tr>
	<td colspan="1" rowspan="2" class="subsubtitle">�{�[�����O��</td>
	<td colspan="1" rowspan="2" class="subsubtitle">�{�[�����O�A��</td>
	<td colspan="3" rowspan="1" class="subsubtitle">�o�x</td>
	<td colspan="3" rowspan="1" class="subsubtitle">�ܓx</td>
	<td colspan="1" rowspan="2" class="subsubtitle">���n�n</td>
	<td colspan="1" rowspan="2" class="subsubtitle">�E���W��</td>
	<td colspan="1" rowspan="2" class="subsubtitle">�@�i��</td>
	<td colspan="1" rowspan="2" class="subsubtitle">����}�敪</td>
	<td colspan="1" rowspan="2" class="subsubtitle">�{�[�����O�R�����g</td>
	<td colspan="2" rowspan="1" class="subsubtitle">�{�[�����O�����p�f�[�^</td>
	<td colspan="2" rowspan="1" class="subsubtitle">�d�q����}</td>
	<td colspan="2" rowspan="1" class="subsubtitle">�d�q�ȗ�����}</td>
	</tr>
	<tr>
	<th>�o�x_�x</th>
	<th>�o�x_��</th>
	<th>�o�x_�b</th>
	<th>�ܓx_�x</th>
	<th>�ܓx_��</th>
	<th>�ܓx_�b</th>
	<th>�{�[�����O�����p�f�[�^�t�@�C����</th>
	<th>�{�[�����O�����p�f�[�^�쐬�\�t�g�E�F�A��</th>
	<th>�d�q����}�t�@�C����</th>
	<th>�d�q����}�쐬�\�t�g�E�F�A��</th>
	<th>�d�q�ȗ�����}�t�@�C����</th>
	<th>�d�q�ȗ�����}�쐬�\�t�g�E�F�A��</th>
	</tr>
</xsl:template>

<xsl:template name="main">
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
	<xsl:if test="count(�o�x)=0">
		<td><xsl:call-template name="elm-empty"/></td>
		<td><xsl:call-template name="elm-empty"/></td>
		<td><xsl:call-template name="elm-empty"/></td>
	</xsl:if>
	<xsl:if test="count(�o�x)!=0">
		<xsl:for-each select="�o�x">
			<xsl:if test="count(�o�x_�x)=0">
				<td><xsl:call-template name="elm-empty"/></td>
			</xsl:if>
			<xsl:if test="count(�o�x_�x)!=0">
				<td><xsl:for-each select="�o�x_�x"><xsl:call-template name="textdata"/></xsl:for-each></td>
			</xsl:if>
			<xsl:if test="count(�o�x_��)=0">
				<td><xsl:call-template name="elm-empty"/></td>
			</xsl:if>
			<xsl:if test="count(�o�x_��)!=0">
				<td><xsl:for-each select="�o�x_��"><xsl:call-template name="textdata"/></xsl:for-each></td>
			</xsl:if>
			<xsl:if test="count(�o�x_�b)=0">
				<td><xsl:call-template name="elm-empty"/></td>
			</xsl:if>
			<xsl:if test="count(�o�x_�b)!=0">
				<td><xsl:for-each select="�o�x_�b"><xsl:call-template name="textdata"/></xsl:for-each></td>
			</xsl:if>
		</xsl:for-each>
	</xsl:if>
	<xsl:if test="count(�ܓx)=0">
		<td><xsl:call-template name="elm-empty"/></td>
		<td><xsl:call-template name="elm-empty"/></td>
		<td><xsl:call-template name="elm-empty"/></td>
	</xsl:if>
	<xsl:if test="count(�ܓx)!=0">
		<xsl:for-each select="�ܓx">
			<xsl:if test="count(�ܓx_�x)=0">
				<td><xsl:call-template name="elm-empty"/></td>
			</xsl:if>
			<xsl:if test="count(�ܓx_�x)!=0">
				<td><xsl:for-each select="�ܓx_�x"><xsl:call-template name="textdata"/></xsl:for-each></td>
			</xsl:if>
			<xsl:if test="count(�ܓx_��)=0">
				<td><xsl:call-template name="elm-empty"/></td>
			</xsl:if>
			<xsl:if test="count(�ܓx_��)!=0">
				<td><xsl:for-each select="�ܓx_��"><xsl:call-template name="textdata"/></xsl:for-each></td>
			</xsl:if>
			<xsl:if test="count(�ܓx_�b)=0">
				<td><xsl:call-template name="elm-empty"/></td>
			</xsl:if>
			<xsl:if test="count(�ܓx_�b)!=0">
				<td><xsl:for-each select="�ܓx_�b"><xsl:call-template name="textdata"/></xsl:for-each></td>
			</xsl:if>
		</xsl:for-each>
	</xsl:if>
	<xsl:if test="count(���n�n)=0">
		<td><xsl:call-template name="elm-empty"/></td>
	</xsl:if>
	<xsl:if test="count(���n�n)!=0">
		<td><xsl:for-each select="���n�n"><xsl:call-template name="textdata"/></xsl:for-each></td>
	</xsl:if>
	<xsl:if test="count(�E���W��)=0">
		<td><xsl:call-template name="elm-empty"/></td>
	</xsl:if>
	<xsl:if test="count(�E���W��)!=0">
		<td><xsl:for-each select="�E���W��"><xsl:call-template name="textdata"/></xsl:for-each></td>
	</xsl:if>
	<xsl:if test="count(�@�i��)=0">
		<td><xsl:call-template name="elm-empty"/></td>
	</xsl:if>
	<xsl:if test="count(�@�i��)!=0">
		<td><xsl:for-each select="�@�i��"><xsl:call-template name="textdata"/></xsl:for-each></td>
	</xsl:if>
	<xsl:if test="count(����}�敪)=0">
		<td><xsl:call-template name="elm-empty"/></td>
	</xsl:if>
	<xsl:if test="count(����}�敪)!=0">
		<td><xsl:for-each select="����}�敪"><xsl:call-template name="textdata"/></xsl:for-each></td>
	</xsl:if>
	<xsl:if test="count(�{�[�����O�R�����g)=0">
		<td><xsl:call-template name="elm-empty"/></td>
	</xsl:if>
	<xsl:if test="count(�{�[�����O�R�����g)!=0">
		<td><xsl:for-each select="�{�[�����O�R�����g[1]">
			<xsl:for-each select="../�{�[�����O�R�����g">
				<xsl:if test="position()=1"><xsl:call-template name="textdata"/></xsl:if>
				<xsl:if test="position()!=1">,<xsl:call-template name="textdata"/></xsl:if>
			</xsl:for-each>
		</xsl:for-each></td>
	</xsl:if>
	<xsl:if test="count(�{�[�����O�����p�f�[�^)=0">
		<td><xsl:call-template name="elm-empty"/></td>
		<td><xsl:call-template name="elm-empty"/></td>		
	</xsl:if>
	<xsl:if test="count(�{�[�����O�����p�f�[�^)!=0">
		<xsl:for-each select="�{�[�����O�����p�f�[�^">
			<td>
				<xsl:for-each select="�{�[�����O�����p�f�[�^�t�@�C����">
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
				<xsl:for-each select="�{�[�����O�����p�f�[�^�쐬�\�t�g�E�F�A��">
					<xsl:call-template name="textdata"/>
				</xsl:for-each>
			</td>
		</xsl:for-each>
	</xsl:if>
	<xsl:if test="count(�d�q����})=0">
		<td><xsl:call-template name="elm-empty"/></td>
	</xsl:if>
	<xsl:if test="count(�d�q����})!=0">
		<xsl:for-each select="�d�q����}">
			<td>
				<xsl:for-each select="�d�q����}�t�@�C����">
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
			<td><xsl:for-each select="�d�q����}�쐬�\�t�g�E�F�A��"><xsl:call-template name="textdata"/></xsl:for-each></td>
		</xsl:for-each>
	</xsl:if>
	<xsl:if test="count(�d�q�ȗ�����})=0">
		<td><xsl:call-template name="elm-empty"/></td>
	</xsl:if>
	<xsl:if test="count(�d�q�ȗ�����})!=0">
		<xsl:for-each select="�d�q�ȗ�����}">
			<td>
				<xsl:for-each select="�d�q�ȗ�����}�t�@�C����">
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
			<td><xsl:for-each select="�d�q�ȗ�����}�쐬�\�t�g�E�F�A��"><xsl:call-template name="textdata"/></xsl:for-each></td>
		</xsl:for-each>
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