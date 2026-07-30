---
name: Lustre & Logic
colors:
  surface: '#f9f9ff'
  surface-dim: '#d8dae2'
  surface-bright: '#f9f9ff'
  surface-container-lowest: '#ffffff'
  surface-container-low: '#f2f3fb'
  surface-container: '#ecedf6'
  surface-container-high: '#e7e8f0'
  surface-container-highest: '#e1e2ea'
  on-surface: '#191c21'
  on-surface-variant: '#424752'
  inverse-surface: '#2e3037'
  inverse-on-surface: '#eff0f9'
  outline: '#727783'
  outline-variant: '#c2c6d4'
  surface-tint: '#005db7'
  primary: '#004d99'
  on-primary: '#ffffff'
  primary-container: '#1565c0'
  on-primary-container: '#dae5ff'
  inverse-primary: '#a9c7ff'
  secondary: '#5d5f5f'
  on-secondary: '#ffffff'
  secondary-container: '#dfe0e0'
  on-secondary-container: '#616363'
  tertiary: '#425059'
  on-tertiary: '#ffffff'
  tertiary-container: '#5a6871'
  on-tertiary-container: '#d8e7f2'
  error: '#ba1a1a'
  on-error: '#ffffff'
  error-container: '#ffdad6'
  on-error-container: '#93000a'
  primary-fixed: '#d6e3ff'
  primary-fixed-dim: '#a9c7ff'
  on-primary-fixed: '#001b3d'
  on-primary-fixed-variant: '#00468c'
  secondary-fixed: '#e2e2e2'
  secondary-fixed-dim: '#c6c6c7'
  on-secondary-fixed: '#1a1c1c'
  on-secondary-fixed-variant: '#454747'
  tertiary-fixed: '#d6e5ef'
  tertiary-fixed-dim: '#bac9d3'
  on-tertiary-fixed: '#0f1d25'
  on-tertiary-fixed-variant: '#3b4951'
  background: '#f9f9ff'
  on-background: '#191c21'
  surface-variant: '#e1e2ea'
typography:
  headline-lg:
    fontFamily: DM Sans
    fontSize: 32px
    fontWeight: '700'
    lineHeight: 40px
    letterSpacing: -0.02em
  headline-lg-mobile:
    fontFamily: DM Sans
    fontSize: 28px
    fontWeight: '700'
    lineHeight: 36px
    letterSpacing: -0.01em
  section-title:
    fontFamily: DM Sans
    fontSize: 20px
    fontWeight: '600'
    lineHeight: 28px
  body-md:
    fontFamily: DM Sans
    fontSize: 16px
    fontWeight: '400'
    lineHeight: 24px
  label-md:
    fontFamily: DM Sans
    fontSize: 14px
    fontWeight: '500'
    lineHeight: 20px
  caption:
    fontFamily: DM Sans
    fontSize: 12px
    fontWeight: '400'
    lineHeight: 16px
rounded:
  sm: 0.25rem
  DEFAULT: 0.5rem
  md: 0.75rem
  lg: 1rem
  xl: 1.5rem
  full: 9999px
spacing:
  base: 8px
  xs: 4px
  sm: 8px
  md: 16px
  lg: 24px
  xl: 32px
  container-padding: 24px
  gutter: 16px
---

## Brand & Style
The design system is engineered for a Mineral Sales Receipt Generator, prioritizing clarity, trust, and professional efficiency. The brand personality is grounded and systematic, reflecting the geological and industrial nature of the product while maintaining a high-end, contemporary digital feel.

The style leverages **Modern Corporate** principles with a heavy influence from **Material 3 (M3)**. It focuses on a clean, spacious layout that reduces cognitive load during data entry. By combining high-quality typography with a structured 8px grid, the UI evokes a sense of precision and reliability, essential for financial documentation in the mineral trade.

## Colors
The color palette is anchored by a deep Material Blue, signaling authority and stability. 
- **Primary**: Used for key actions, active states, and branding elements.
- **Secondary/Surface**: Pure white is utilized for high-clarity workspaces and card backgrounds to ensure a "paper-like" feel for receipt generation.
- **Accent**: A soft light blue used for subtle backgrounds, hover states, and tonal highlighting.
- **Neutral/Background**: A very light cool gray creates a soft contrast against the white surfaces, defining the spatial hierarchy without harsh lines.
- **Semantic**: High-visibility red and green are reserved for error handling and transaction confirmation, respectively.

## Typography
This design system utilizes **DM Sans** exclusively to maintain a modern, geometric, and highly legible appearance. 

The typographic hierarchy is strictly enforced to guide the user through the receipt generation process:
- **Large Titles**: Reserved for page headers and summary totals.
- **Section Titles**: Used to delineate different parts of the receipt (e.g., Buyer Info, Mineral Specs).
- **Form Labels**: Set in Medium weight to ensure they remain distinct from the user input.
- **Body Text**: Optimized for readability during long-form data entry.
- **Captions**: Used for secondary metadata or helper text beneath input fields.

## Layout & Spacing
The design system employs an **8px linear grid** to ensure mathematical harmony across all components.

- **Desktop**: Features a permanent navigation drawer (280px width) on the left. The main content area uses a 12-column fluid grid with 24px margins.
- **Tablet**: The drawer transitions to a persistent mini-rail or a modal overlay. A 16px margin is used.
- **Mobile**: Uses a 4-column grid with a sliding navigation drawer triggered by a hamburger menu. Margins are kept at 16px to maximize screen real estate for data tables.

Padding within cards and containers should default to `lg` (24px) to maintain the "spacious" requirement of the design narrative.

## Elevation & Depth
In alignment with Material 3 principles, depth is communicated through **Tonal Layers** and **Ambient Shadows**.

- **Level 0 (Background)**: The flat `#F5F7FA` surface.
- **Level 1 (Cards)**: White surfaces with a very soft, diffused shadow (`0px 2px 4px rgba(0,0,0,0.05)`). Used for secondary information modules.
- **Level 2 (Main Content/Active Cards)**: White surfaces with a slightly more pronounced shadow (`0px 4px 12px rgba(0,0,0,0.08)`). Used for the primary receipt generator card.
- **Level 3 (Modals/Floating Actions)**: Distinct shadow for high priority (`0px 8px 24px rgba(0,0,0,0.12)`).

Shadow colors should be slightly tinted with the Primary Blue (`#1565C0`) at extremely low opacity to keep the UI feeling cohesive.

## Shapes
The shape language is "Rounded," providing a friendly yet professional appearance that softens the industrial nature of mineral sales.

- **Cards & Large Containers**: Use a 16px (`rounded-lg`) corner radius to create a distinct, modern enclosure.
- **Buttons & Input Fields**: Use a 12px corner radius, striking a balance between the blocky nature of traditional forms and the fully circular pill shape.
- **Chips & Tags**: Use a pill shape (fully rounded) for status indicators (e.g., "Paid", "Pending").

## Components
- **Buttons**: Primary buttons use a solid `#1565C0` fill with white text. Secondary buttons use an outlined style with a 1px border. All buttons have a height of 48px to be touch-friendly.
- **Input Fields**: Follow the M3 "Filled" or "Outlined" pattern. Use `#F5F7FA` as the fill for "Filled" inputs to provide a subtle contrast against the white card surfaces. Labels are persistent or use the floating transition.
- **Cards**: The central unit of the UI. Must have 16px rounded corners and Level 1 or 2 elevation. No borders; depth is defined by shadows.
- **Lists**: Used for mineral line items. Items should be separated by thin, low-contrast horizontal rules (`#E0E0E0`) with 16px vertical padding.
- **Data Table**: For receipt line items, use a minimalist approach with no vertical borders. The header row should be subtly shaded with the Accent color (`#E3F2FD`).
- **Status Chips**: Use the Primary/Accent colors for informational tags, and Success/Error colors for transaction statuses. Text should be uppercase and bold at 12px.