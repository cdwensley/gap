#############################################################################
##
#W  simple.gd                 GAP Library                    Alexander Hulpke
##
#H  @(#)$Id$
##
#Y  Copyright (C) 2011 The GAP Group
##
##  This file contains basic constructions for simple groups of bounded size,
##  if necessary by calling the `atlasrep' package.
##
Revision.simple_gd :=
    "@(#)$Id$";


#############################################################################
##
#F  SimpleGroup( <id> [,<param1>[,<param2>[] )  
##
##  <#GAPDoc Label="SimpleGroup">
##  <ManSection>
##  <Func Name="SimpleGroup" Arg='id [,param]'/>
##
##  <Description>
##  This function will construct <B>an</B> instance of the specified simple group.
##  Groups are specified via their name in ATLAS style notation, with parameters added
##  if necessary. The intelligence applied to parsing the name is limited, and at the
##  moment no proper extensions can be constructed.
##  For groups who do not have a permutation representation of small degree the
##  ATLASREP package might need to be installed to construct theses groups.
##  <Example><![CDATA[
##  gap> g:=SimpleGroup("M(23)");
##  M23
##  gap> Size(g);
##  10200960
##  gap> g:=SimpleGroup("PSL",3,5);
##  PSL(3,5)
##  gap> Size(g);
##  372000
##  gap> g:=SimpleGroup("PSp6",2);    
##  PSp(6,2)
##  ]]></Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction("SimpleGroup");

#############################################################################
##
#F  SimpleGroupsIterator( [<start>,<end>] )
##
##  <#GAPDoc Label="SimpleGroupsIterator">
##  <ManSection>
##  <Func Name="SimpleGroupsIterator" Arg='[start[,end]]'/>
##
##  <Description>
##  This function returns an iterator that will run over all simple groups, starting
##  at order <A>start</A> if specified, up to order <M>10^{18}</M> (or -- if specified
##  -- order <A>end</A>). If the option <A>NOPSL2</A> is given, groups of type
##  <M>PSL_2(q)</M> are ommitted.
##  <Example><![CDATA[
##  gap> it:=SimpleGroupsIterator(20000);
##  <iterator>
##  gap> List([1..8],x->NextIterator(it)); 
##  [ A8, PSL(3,4), PSL(2,37), PSp(4,3), Sz(8), PSL(2,32), PSL(2,41), PSL(2,43) ]
##  gap> it:=SimpleGroupsIterator(1,2000);;
##  gap> l:=[];;for i in it do Add(l,i);od;l;
##  [ A5, PSL(2,7), A6, PSL(2,8), PSL(2,11), PSL(2,13) ]
##  gap> it:=SimpleGroupsIterator(20000,100000:NOPSL2);;
##  gap> l:=[];;for i in it do Add(l,i);od;l;
##  [ A8, PSL(3,4), PSp(4,3), Sz(8), PSU(3,4), M12 ]
##  ]]></Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction("SimpleGroupsIterator");
