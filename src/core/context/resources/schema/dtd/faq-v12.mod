<!-- ===================================================================

     Apache Faq module (Version 1.1)

TYPICAL INVOCATION:

  <!ENTITY % faq PUBLIC
      "-//APACHE//ENTITIES FAQ Vxy//EN"
      "faq-vxy.mod">
  %faq;

  where

    x := major version
    y := minor version

NOTES:

AUTHORS:
  Steven Noels <stevenn@apache.org>

FIXME:

CHANGE HISTORY:
[Version 1.0]
  20020608 Initial version. (SN)
[Version 1.2]
  20030505 Allow mixed content in <answer>, to match <question> (JT)

COPYRIGHT:
  Copyright (c) 2002 The Apache Software Foundation.

  Permission to copy in any form is granted provided this notice is
  included in all copies. Permission to redistribute is granted
  provided this file is distributed untouched in all its parts and
  included files.

==================================================================== -->

<!-- =============================================================== -->
<!-- Element declarations -->
<!-- =============================================================== -->

<!ELEMENT faqs (authors?, (faq|part)+)>
<!ATTLIST faqs %common.att;
               %title.att;>

    <!ELEMENT part (title, (faq | part)+) >
    <!ATTLIST part %common.att;>

    <!ELEMENT faq (question, answer)>
    <!ATTLIST faq %common.att;>

        <!ELEMENT question (%content.mix;|elaboration)*>
        <!ATTLIST question %common.att;>

        <!ELEMENT elaboration (%content.mix;)*>
        <!ATTLIST elaboration %common.att;>

        <!ELEMENT answer (%flow;)*>
        <!ATTLIST answer author IDREF #IMPLIED>

<!-- =============================================================== -->
<!-- End of DTD -->
<!-- =============================================================== -->
