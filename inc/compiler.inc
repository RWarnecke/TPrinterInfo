//----------------------------------------------------------------------------------------------------------------------
//
// The following symbols are defined:
//
// - COMPILER_1    : Kylix/Delphi/BCB 1.x is the compiler.
// - COMPILER_1_UP : Kylix/Delphi/BCB 1.x or higher is the compiler.
// - COMPILER_2    : Kylix/Delphi 2.x or BCB 1.x is the compiler.
// - COMPILER_2_UP : Kylix/Delphi 2.x or higher, or BCB 1.x or higher is the compiler.
// - COMPILER_3    : Kylix/Delphi/BCB 3.x is the compiler.
// - COMPILER_3_UP : Kylix/Delphi/BCB 3.x or higher is the compiler.
// - COMPILER_4    : Kylix/Delphi/BCB 4.x is the compiler.
// - COMPILER_4_UP : Kylix/Delphi/BCB 4.x or higher is the compiler.
// - COMPILER_5    : Kylix/Delphi/BCB 5.x is the compiler.
// - COMPILER_5_UP : Kylix/Delphi/BCB 5.x or higher is the compiler.
// - COMPILER_6    : Kylix/Delphi/BCB 6.x is the compiler.
// - COMPILER_6_UP : Kylix/Delphi/BCB 6.x or higher is the compiler.
// - COMPILER_7    : Kylix/Delphi/BCB 7.x is the compiler.
// - COMPILER_7_UP : Kylix/Delphi/BCB 7.x or higher is the compiler.
// - COMPILER_8    : Kylix/Delphi/BCB 8.x is the compiler.
// - COMPILER_8_UP : Kylix/Delphi/BCB 8.x or higher is the compiler.
// - COMPILER_9    : Kylix/Delphi/BCB 9.x is the compiler.
// - COMPILER_9_UP : Kylix/Delphi/BCB 9.x or higher is the compiler.
// - COMPILER_10    : Kylix/Delphi/BCB 10.x is the compiler.
// - COMPILER_10_UP : Kylix/Delphi/BCB 10.x or higher is the compiler.
// - COMPILER_11    : Kylix/Delphi/BCB 11.x is the compiler.
// - COMPILER_11_UP : Kylix/Delphi/BCB 11.x or higher is the compiler.
// - COMPILER_12    : Kylix/Delphi/BCB 12.x is the compiler.
// - COMPILER_12_UP : Kylix/Delphi/BCB 12.x or higher is the compiler.
// - COMPILER_14    : Kylix/Delphi/BCB 14.x is the compiler.
// - COMPILER_14_UP : Kylix/Delphi/BCB 14.x or higher is the compiler.
// - COMPILER_15    : Kylix/Delphi/BCB 15.x is the compiler.
// - COMPILER_15_UP : Kylix/Delphi/BCB 15.x or higher is the compiler.
// - COMPILER_16    : Kylix/Delphi/BCB 16.x is the compiler.
// - COMPILER_16_UP : Kylix/Delphi/BCB 16.x or higher is the compiler.
// - COMPILER_17    : Kylix/Delphi/BCB 17.x is the compiler.
// - COMPILER_17_UP : Kylix/Delphi/BCB 17.x or higher is the compiler.
// - COMPILER_18    : Kylix/Delphi/BCB 18.x is the compiler.
// - COMPILER_18_UP : Kylix/Delphi/BCB 18.x or higher is the compiler.
// - COMPILER_19    : Kylix/Delphi/BCB 19.x is the compiler.
// - COMPILER_19_UP : Kylix/Delphi/BCB 19.x or higher is the compiler.
// - COMPILER_20    : Kylix/Delphi/BCB 20.x is the compiler.
// - COMPILER_20_UP : Kylix/Delphi/BCB 20.x or higher is the compiler.
// - COMPILER_21    : Kylix/Delphi/BCB 21.x is the compiler.
// - COMPILER_21_UP : Kylix/Delphi/BCB 21.x or higher is the compiler.
// - COMPILER_22    : Kylix/Delphi/BCB 22.x is the compiler.
// - COMPILER_22_UP : Kylix/Delphi/BCB 22.x or higher is the compiler.
//
//----------------------------------------------------------------------------------------------------------------------

{$ifdef Win32}

// Compiler defines not specific to a particlular platform.

  // BDS XE8 (BDS 16.0) DELPHI and BCB are no longer defined, only COMPILER
  {$ifdef VER290}
    {$define COMPILER_22}
    {$define DELPHI}
    {$define DELPHI_22}
  {$endif VER290}

  // BDS XE7 (BDS 15.0) DELPHI and BCB are no longer defined, only COMPILER
  {$ifdef VER280}
    {$define COMPILER_21}
    {$define DELPHI}
    {$define DELPHI_21}
  {$endif VER280}

  // BDS XE6 (BDS 14.0) DELPHI and BCB are no longer defined, only COMPILER
  {$ifdef VER270}
    {$define COMPILER_20}
    {$define DELPHI}
    {$define DELPHI_20}
  {$endif VER270}

  // BDS XE5 (BDS 12.0) DELPHI and BCB are no longer defined, only COMPILER
  {$ifdef VER260}
    {$define COMPILER_19}
    {$define DELPHI}
    {$define DELPHI_19}
  {$endif VER260}

  // BDS XE4 (BDS 11.0) DELPHI and BCB are no longer defined, only COMPILER
  {$ifdef VER250}
    {$define COMPILER_18}
    {$define DELPHI}
    {$define DELPHI_18}
  {$endif VER250}

  // BDS XE3 (BDS 10.0) DELPHI and BCB are no longer defined, only COMPILER
  {$ifdef VER240}
    {$define COMPILER_17}
    {$define DELPHI}
    {$define DELPHI_117}
  {$endif VER240}

  // BDS XE2 (BDS 9.0) DELPHI and BCB are no longer defined, only COMPILER
  {$ifdef VER230}
    {$define COMPILER_16}
    {$define DELPHI}
    {$define DELPHI_16}
  {$endif VER230}

  // BDS XE (BDS 8.0) DELPHI and BCB are no longer defined, only COMPILER
  {$ifdef VER220}
    {$define COMPILER_15}
    {$define DELPHI}
    {$define DELPHI_15}
  {$endif VER220}

  // BDS 2010 (BDS 7.0) DELPHI and BCB are no longer defined, only COMPILER
  {$ifdef VER210}
    {$define COMPILER_14}
    {$define DELPHI}
    {$define DELPHI_14}
  {$endif VER210}

  // BDS 2009 (BDS 6.0) DELPHI and BCB are no longer defined, only COMPILER
  {$ifdef VER200}
    {$define COMPILER_12}
    {$define DELPHI}
    {$define DELPHI_12}
  {$endif VER200}

  // BDS 2007 (BDS 5.0) DELPHI and BCB are no longer defined, only COMPILER
  {$ifdef VER190}
    {$define COMPILER_11}
    {$define DELPHI}
    {$define DELPHI_11}
  {$endif VER190}

  // BDS2006 DELPHI and BCB are no longer defined, only COMPILER
  {$ifdef VER180}
    {$define COMPILER_10}
    {$define DELPHI}
    {$define DELPHI_10}
  {$endif VER180}

  {$ifdef VER170}
    {$define COMPILER_9}
    {$define DELPHI}
    {$define DELPHI_9}
  {$endif VER170}

  {$ifdef VER160}
    {$define COMPILER_8}
    {$define DELPHI}
    {$define DELPHI_8}
  {$endif VER160}

  {$ifdef VER150}
    {$define COMPILER_7}
    {$define DELPHI}
    {$define DELPHI_7}
  {$endif}

  {$ifdef VER140}
    {$define COMPILER_6}
    {$define DELPHI}
    {$define DELPHI_6}
  {$endif}

{$ENDIF}  // ENDIF - Win32

{$ifdef Win64}

// Compiler defines not specific to a particlular platform.

  // BDS XE8 (BDS 16.0) DELPHI and BCB are no longer defined, only COMPILER
  {$ifdef VER290}
    {$define COMPILER_22}
    {$define DELPHI}
    {$define DELPHI_22}
  {$endif VER290}

  // BDS XE7 (BDS 15.0) DELPHI and BCB are no longer defined, only COMPILER
  {$ifdef VER280}
    {$define COMPILER_21}
    {$define DELPHI}
    {$define DELPHI_21}
  {$endif VER280}

  // BDS XE6 (BDS 14.0) DELPHI and BCB are no longer defined, only COMPILER
  {$ifdef VER270}
    {$define COMPILER_20}
    {$define DELPHI}
    {$define DELPHI_20}
  {$endif VER270}

  // BDS XE5 (BDS 12.0) DELPHI and BCB are no longer defined, only COMPILER
  {$ifdef VER260}
    {$define COMPILER_19}
    {$define DELPHI}
    {$define DELPHI_19}
  {$endif VER260}

  // BDS XE4 (BDS 11.0) DELPHI and BCB are no longer defined, only COMPILER
  {$ifdef VER250}
    {$define COMPILER_18}
    {$define DELPHI}
    {$define DELPHI_18}
  {$endif VER250}

  // BDS XE3 (BDS 10.0) DELPHI and BCB are no longer defined, only COMPILER
  {$ifdef VER240}
    {$define COMPILER_17}
    {$define DELPHI}
    {$define DELPHI_17}
  {$endif VER240}

  // BDS XE2 (BDS 9.0) DELPHI and BCB are no longer defined, only COMPILER
  {$ifdef VER230}
    {$define COMPILER_16}
    {$define DELPHI}
    {$define DELPHI_16}
  {$endif VER230}

{$ENDIF}  // ENDIF - Win64

{$ifdef COMPILER_6}
  {$define COMPILER_6_UP}
{$endif}

{$ifdef COMPILER_7}
  {$define COMPILER_6_UP}
  {$define COMPILER_7_UP}
{$endif}

{$ifdef COMPILER_9}
  {$define COMPILER_6_UP}
  {$define COMPILER_7_UP}
  {$define COMPILER_9_UP}
{$endif}

{$ifdef COMPILER_10}
  {$define COMPILER_6_UP}
  {$define COMPILER_7_UP}
  {$define COMPILER_9_UP}
  {$define COMPILER_10_UP}
{$endif}

{$ifdef COMPILER_11}
  {$define COMPILER_6_UP}
  {$define COMPILER_7_UP}
  {$define COMPILER_9_UP}
  {$define COMPILER_10_UP}
  {$define COMPILER_11_UP}
{$endif}

{$ifdef COMPILER_12}
  {$define COMPILER_6_UP}
  {$define COMPILER_7_UP}
  {$define COMPILER_9_UP}
  {$define COMPILER_10_UP}
  {$define COMPILER_11_UP}
  {$define COMPILER_12_UP}
{$endif}

{$ifdef COMPILER_14}
  {$define COMPILER_6_UP}
  {$define COMPILER_7_UP}
  {$define COMPILER_9_UP}
  {$define COMPILER_10_UP}
  {$define COMPILER_11_UP}
  {$define COMPILER_12_UP}
  {$define COMPILER_14_UP}
{$endif}

{$ifdef COMPILER_15}
  {$define COMPILER_6_UP}
  {$define COMPILER_7_UP}
  {$define COMPILER_9_UP}
  {$define COMPILER_10_UP}
  {$define COMPILER_11_UP}
  {$define COMPILER_12_UP}
  {$define COMPILER_14_UP}
  {$define COMPILER_15_UP}
{$endif}

{$ifdef COMPILER_16}
  {$define COMPILER_6_UP}
  {$define COMPILER_7_UP}
  {$define COMPILER_9_UP}
  {$define COMPILER_10_UP}
  {$define COMPILER_11_UP}
  {$define COMPILER_12_UP}
  {$define COMPILER_14_UP}
  {$define COMPILER_15_UP}
  {$define COMPILER_16_UP}
{$endif}

{$ifdef COMPILER_17}
  {$define COMPILER_6_UP}
  {$define COMPILER_7_UP}
  {$define COMPILER_9_UP}
  {$define COMPILER_10_UP}
  {$define COMPILER_11_UP}
  {$define COMPILER_12_UP}
  {$define COMPILER_14_UP}
  {$define COMPILER_15_UP}
  {$define COMPILER_16_UP}
  {$define COMPILER_17_UP}
{$endif}

{$ifdef COMPILER_18}
  {$define COMPILER_6_UP}
  {$define COMPILER_7_UP}
  {$define COMPILER_9_UP}
  {$define COMPILER_10_UP}
  {$define COMPILER_11_UP}
  {$define COMPILER_12_UP}
  {$define COMPILER_14_UP}
  {$define COMPILER_15_UP}
  {$define COMPILER_16_UP}
  {$define COMPILER_17_UP}
  {$define COMPILER_18_UP}
{$endif}

{$ifdef COMPILER_19}
  {$define COMPILER_6_UP}
  {$define COMPILER_7_UP}
  {$define COMPILER_9_UP}
  {$define COMPILER_10_UP}
  {$define COMPILER_11_UP}
  {$define COMPILER_12_UP}
  {$define COMPILER_14_UP}
  {$define COMPILER_15_UP}
  {$define COMPILER_16_UP}
  {$define COMPILER_17_UP}
  {$define COMPILER_18_UP}
  {$define COMPILER_19_UP}
{$endif}

{$ifdef COMPILER_20}
  {$define COMPILER_6_UP}
  {$define COMPILER_7_UP}
  {$define COMPILER_9_UP}
  {$define COMPILER_10_UP}
  {$define COMPILER_11_UP}
  {$define COMPILER_12_UP}
  {$define COMPILER_14_UP}
  {$define COMPILER_15_UP}
  {$define COMPILER_16_UP}
  {$define COMPILER_17_UP}
  {$define COMPILER_18_UP}
  {$define COMPILER_19_UP}
  {$define COMPILER_20_UP}
{$endif}

{$ifdef COMPILER_21}
  {$define COMPILER_6_UP}
  {$define COMPILER_7_UP}
  {$define COMPILER_9_UP}
  {$define COMPILER_10_UP}
  {$define COMPILER_11_UP}
  {$define COMPILER_12_UP}
  {$define COMPILER_14_UP}
  {$define COMPILER_15_UP}
  {$define COMPILER_16_UP}
  {$define COMPILER_17_UP}
  {$define COMPILER_18_UP}
  {$define COMPILER_19_UP}
  {$define COMPILER_20_UP}
  {$define COMPILER_21_UP}
{$endif}

{$ifdef COMPILER_22}
  {$define COMPILER_6_UP}
  {$define COMPILER_7_UP}
  {$define COMPILER_9_UP}
  {$define COMPILER_10_UP}
  {$define COMPILER_11_UP}
  {$define COMPILER_12_UP}
  {$define COMPILER_14_UP}
  {$define COMPILER_15_UP}
  {$define COMPILER_16_UP}
  {$define COMPILER_17_UP}
  {$define COMPILER_18_UP}
  {$define COMPILER_19_UP}
  {$define COMPILER_20_UP}
  {$define COMPILER_21_UP}
  {$define COMPILER_22_UP}
{$endif}

// Define the delphi levels
{$ifdef DELPHI_6}
  {$define DELPHI_6_UP}
{$endif}

{$ifdef DELPHI_7}
  {$define DELPHI_6_UP}
  {$define DELPHI_7_UP}
{$endif}

{$ifdef DELPHI_9}
  {$define DELPHI_6_UP}
  {$define DELPHI_7_UP}
  {$define DELPHI_9_UP}
{$endif}

{$ifdef DELPHI_10}
  {$define DELPHI_6_UP}
  {$define DELPHI_7_UP}
  {$define DELPHI_9_UP}
  {$define DELPHI_10_UP}
{$endif}

{$ifdef DELPHI_11}
  {$define DELPHI_6_UP}
  {$define DELPHI_7_UP}
  {$define DELPHI_9_UP}
  {$define DELPHI_10_UP}
  {$define DELPHI_11_UP}
{$endif}

{$ifdef DELPHI_12}
  {$define DELPHI_6_UP}
  {$define DELPHI_7_UP}
  {$define DELPHI_9_UP}
  {$define DELPHI_10_UP}
  {$define DELPHI_11_UP}
  {$define DELPHI_12_UP}
{$endif}

{$ifdef DELPHI_14}
  {$define DELPHI_6_UP}
  {$define DELPHI_7_UP}
  {$define DELPHI_9_UP}
  {$define DELPHI_10_UP}
  {$define DELPHI_11_UP}
  {$define DELPHI_12_UP}
  {$define DELPHI_14_UP}
{$endif}

{$ifdef DELPHI_15}
  {$define DELPHI_6_UP}
  {$define DELPHI_7_UP}
  {$define DELPHI_9_UP}
  {$define DELPHI_10_UP}
  {$define DELPHI_11_UP}
  {$define DELPHI_12_UP}
  {$define DELPHI_14_UP}
  {$define DELPHI_15_UP}
{$endif}

{$ifdef DELPHI_16}
  {$define DELPHI_6_UP}
  {$define DELPHI_7_UP}
  {$define DELPHI_9_UP}
  {$define DELPHI_10_UP}
  {$define DELPHI_11_UP}
  {$define DELPHI_12_UP}
  {$define DELPHI_14_UP}
  {$define DELPHI_15_UP}
  {$define DELPHI_16_UP}
{$endif}

{$ifdef DELPHI_17}
  {$define DELPHI_6_UP}
  {$define DELPHI_7_UP}
  {$define DELPHI_9_UP}
  {$define DELPHI_10_UP}
  {$define DELPHI_11_UP}
  {$define DELPHI_12_UP}
  {$define DELPHI_14_UP}
  {$define DELPHI_15_UP}
  {$define DELPHI_16_UP}
  {$define DELPHI_17_UP}
{$endif}

{$ifdef DELPHI_18}
  {$define DELPHI_6_UP}
  {$define DELPHI_7_UP}
  {$define DELPHI_9_UP}
  {$define DELPHI_10_UP}
  {$define DELPHI_11_UP}
  {$define DELPHI_12_UP}
  {$define DELPHI_14_UP}
  {$define DELPHI_15_UP}
  {$define DELPHI_16_UP}
  {$define DELPHI_17_UP}
  {$define DELPHI_18_UP}
{$endif}

{$ifdef DELPHI_19}
  {$define DELPHI_6_UP}
  {$define DELPHI_7_UP}
  {$define DELPHI_9_UP}
  {$define DELPHI_10_UP}
  {$define DELPHI_11_UP}
  {$define DELPHI_12_UP}
  {$define DELPHI_14_UP}
  {$define DELPHI_15_UP}
  {$define DELPHI_16_UP}
  {$define DELPHI_17_UP}
  {$define DELPHI_18_UP}
  {$define DELPHI_19_UP}
{$endif}

{$ifdef DELPHI_20}
  {$define DELPHI_6_UP}
  {$define DELPHI_7_UP}
  {$define DELPHI_9_UP}
  {$define DELPHI_10_UP}
  {$define DELPHI_11_UP}
  {$define DELPHI_12_UP}
  {$define DELPHI_14_UP}
  {$define DELPHI_15_UP}
  {$define DELPHI_16_UP}
  {$define DELPHI_17_UP}
  {$define DELPHI_18_UP}
  {$define DELPHI_19_UP}
  {$define DELPHI_20_UP}
{$endif}

{$ifdef DELPHI_21}
  {$define DELPHI_6_UP}
  {$define DELPHI_7_UP}
  {$define DELPHI_9_UP}
  {$define DELPHI_10_UP}
  {$define DELPHI_11_UP}
  {$define DELPHI_12_UP}
  {$define DELPHI_14_UP}
  {$define DELPHI_15_UP}
  {$define DELPHI_16_UP}
  {$define DELPHI_17_UP}
  {$define DELPHI_18_UP}
  {$define DELPHI_19_UP}
  {$define DELPHI_20_UP}
  {$define DELPHI_21_UP}
{$endif}

{$ifdef DELPHI_22}
  {$define DELPHI_6_UP}
  {$define DELPHI_7_UP}
  {$define DELPHI_9_UP}
  {$define DELPHI_10_UP}
  {$define DELPHI_11_UP}
  {$define DELPHI_12_UP}
  {$define DELPHI_14_UP}
  {$define DELPHI_15_UP}
  {$define DELPHI_16_UP}
  {$define DELPHI_17_UP}
  {$define DELPHI_18_UP}
  {$define DELPHI_19_UP}
  {$define DELPHI_20_UP}
  {$define DELPHI_21_UP}
  {$define DELPHI_22_UP}
{$endif}

